import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton

/// [RecommendationApi] class
class RecommendationApi {
  /// [openAiApiKey] variable
  String openAiApiKey =
      'sk-proj-wVyvXST4h2uUvuF6GVilT3BlbkFJDfbkfZW5cXu8Tn50xZpw';

  /// [truncatePrompt] method to truncate prompt
  String truncatePrompt(String prompt, int maxLength) {
    if (prompt.length > maxLength) {
      return '${prompt.substring(0, maxLength)}...';
    }
    return prompt;
  }

  /// [getRecommendedPrice] method to get recommended price
  Future<double> getRecommendedPrice(
    String unitDetailsPrompt,
    List<Map<String, dynamic>> referenceData,
  ) async {
    const maxPromptLength = 35000;
    const maxReferenceDataEntries = 50;

    final truncatedPrompt = truncatePrompt(unitDetailsPrompt, maxPromptLength);
    final limitedReferenceData =
        referenceData.take(maxReferenceDataEntries).toList();

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $openAiApiKey',
      },
      body: jsonEncode({
        'model': 'gpt-4o',
        'messages': [
          {
            'role': 'system',
            'content':
                // ignore: lines_longer_than_80_chars
                'You are an AI model that recommends real estate prices based on unit details and market data. Only respond with a number representing the recommended price and nothing else.',
          },
          {
            'role': 'user',
            'content':
                // ignore: lines_longer_than_80_chars
                '$truncatedPrompt Based on the following reference data, recommend a price: ${jsonEncode(limitedReferenceData)}',
          },
        ],
        'max_tokens': 50,
        'temperature': 0.0,
      }),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      final priceString =
          // ignore: avoid_dynamic_calls
          (result['choices'][0]['message']['content'] as String).trim();
      final recommendedPrice = double.parse(priceString);
      return recommendedPrice;
    } else {
      throw Exception('Failed to get recommended price: ${response.body}');
    }
  }
}
