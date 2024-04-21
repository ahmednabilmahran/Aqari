import 'dart:convert';

import 'package:aqari/models/aqari_country_model.dart';
import 'package:flutter/services.dart' show rootBundle;

/// CountriesHelper
class CountriesHelper {
  static List<AqariCountryModel>? _countries;

  /// [countries]
  static List<AqariCountryModel> get countries => _countries ?? [];

  /// Load Countries Data
  static Future<void> loadCountriesData() async {
    final response = await rootBundle.loadString('assets/data/countries.json');
    final data = json.decode(response) as List;
    _countries = data
        .map<AqariCountryModel>(
          (item) => AqariCountryModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();
  }
}
