import 'package:aqari/core/utils/countries_helper.dart';
import 'package:aqari/models/aqari_country_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'countries_dropdown_state.dart';

/// Countries Drop Down Cubit
class CountriesDropDownCubit extends Cubit<CountriesDropDownState> {
  /// Constructor
  CountriesDropDownCubit() : super(CountriesDropDownInitialState());

  /// Selected Country
  late AqariCountryModel selectedCountry;

  /// Drop Down Initialize
  void dropDownInitialize({AqariCountryModel? initialCountry}) {
    // Assuming CountriesHelper.loadCountriesData() was called at app start

    if (initialCountry != null) {
      selectedCountry = initialCountry;
    } else {
      final countriesList = CountriesHelper.countries;
      if (countriesList.isNotEmpty) {
        selectedCountry = countriesList.first;
        emit(CountriesDropDownInitializedState());
      }
    }
  }

  /// Change Value
  void changeValue(AqariCountryModel value) {
    selectedCountry = value;
    emit(CountriesDropDownChangeFlagState());
  }
}
