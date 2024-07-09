import 'dart:io';

import 'package:aqari/main.dart';
import 'package:aqari/models/unit_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton

/// UnitsApi class
class UnitsApi {
  /// getHighlightedUnits method
  Future<List<UnitModel>> getHighlightedUnits() async {
    final response = await supabaseClient
        .from('units')
        .select()
        .eq('is_highlighted', true)
        .select();

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// getFeaturedUnits method
  Future<List<UnitModel>> getFeaturedUnits() async {
    final response = await supabaseClient
        .from('units')
        .select()
        .eq('is_featured', true)
        .select();

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// getAllUnits method
  Future<List<UnitModel>> getAllUnits() async {
    final response = await supabaseClient.from('units').select().select();

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// getNearYouUnits method
  Future<List<UnitModel>> getNearYouUnits(
    double latitude,
    double longitude,
  ) async {
    final response = await supabaseClient.rpc<void>(
      'get_nearby_units',
      params: {
        'lat': latitude,
        'long': longitude,
        'radius_km': 15,
      },
    ).select();

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// searchUnits method
  Future<List<UnitModel>> searchUnits(
    String searchTerm,
    String? propertyType,
    String? minArea,
    String? maxArea,
    List<String> selectedFloors,
  ) async {
    var query = supabaseClient.from('units').select();

    if (searchTerm.isNotEmpty) {
      query = query.ilike('title', '%$searchTerm%');
    }

    if (propertyType != null && propertyType.isNotEmpty) {
      query = query.eq('type', propertyType);
    }

    if (minArea != null && minArea.isNotEmpty) {
      query = query.gte('area_sqft', int.parse(minArea));
    }

    if (maxArea != null && maxArea.isNotEmpty) {
      query = query.lte('area_sqft', int.parse(maxArea));
    }

    if (selectedFloors.isNotEmpty) {
      query = query.inFilter('floor', selectedFloors);
    }

    final response = await query;

    return response.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// getFavoriteUnits method
  Future<List<UnitModel>> getFavoriteUnits(String userId) async {
    // Step 1: Fetch Favorite Unit IDs
    final unitIdResponse = await supabaseClient
        .from('favorites')
        .select('unit_id')
        .eq('user_id', userId);

    // Extract the unit IDs
    final unitIds = unitIdResponse.map((e) => e['unit_id']).toList();

    // Step 2: Use Unit IDs to Fetch Units
    final unitResponse = await supabaseClient
        .from('units')
        .select()
        .inFilter('unit_id', unitIds);

    return unitResponse.map<UnitModel>(UnitModel.fromJson).toList();
  }

  /// Add a new unit
  Future<void> addNewUnit({
    required UnitModel unit,
    required List<String> imagePaths,
  }) async {
    try {
      // Step 1: Insert Unit Data in `units` Table
      final response = await supabaseClient
          .from('units')
          .insert({
            'title': unit.title,
            'description': unit.description,
            'type': unit.type,
            'address': unit.address,
            'city': unit.city,
            'state': unit.state,
            'zip_code': unit.zipCode,
            'latitude': unit.latitude,
            'longitude': unit.longitude,
            'price': unit.price,
            'area_sqft': unit.areaMeter,
            'bedrooms': unit.bedrooms,
            'bathrooms': unit.bathrooms,
            'floor': unit.floor,
            'main_image_url': '', // This will be updated later
            'is_featured': unit.isFeatured,
            'is_highlighted': unit.isHighlighted,
            'created_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
          })
          .select()
          .single();

      // Get the newly inserted unit ID
      final unitId = response['unit_id'];

      // Step 2: Upload Images to Storage and get URLs
      final imageUrls = await Future.wait(
        imagePaths.asMap().entries.map((entry) async {
          final index = entry.key + 1;
          final path = entry.value;
          final bytes = await File(path).readAsBytes();
          final fileName = 'unit_${unitId}_$index.jpg';
          await supabaseClient.storage
              .from('unit-images')
              .uploadBinary(fileName, bytes);

          final url =
              supabaseClient.storage.from('unit-images').getPublicUrl(fileName);
          return url;
        }).toList(),
      );

      // Step 3: Update the unit with the main image URL
      await supabaseClient.from('units').update({
        'main_image_url': imageUrls.first,
      }).eq('unit_id', unitId as int);

      // Step 4: Insert Image URLs in `unit_images` Table
      for (final url in imageUrls) {
        await supabaseClient.from('unit_images').insert({
          'unit_id': unitId,
          'image_url': url,
          'created_at': DateTime.now().toIso8601String(),
        });
      }
    } catch (e) {
      debugPrint('Error adding new unit: $e');
      throw Exception('Error adding new unit: $e');
    }
  }
}
