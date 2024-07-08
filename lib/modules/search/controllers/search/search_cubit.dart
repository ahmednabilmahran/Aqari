import 'package:aqari/apis/units_api.dart';
import 'package:aqari/models/unit_model.dart';
import 'package:aqari/modules/search/controllers/custom_filter/custom_filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

/// SearchCubit
class SearchCubit extends Cubit<SearchState> {
  /// SearchCubit
  SearchCubit(this.api) : super(SearchInitial());

  /// api
  final UnitsApi api;

  /// searchController
  final TextEditingController searchController = TextEditingController();

  /// Search Units
  Future<void> searchUnits(
    String searchTerm,
    CustomFilterState filterState,
  ) async {
    try {
      emit(SearchLoading());

      final units = await api.searchUnits(
        searchTerm,
        filterState.propertyType,
        filterState.minArea,
        filterState.maxArea,
        filterState.selectedFloors,
      );

      emit(SearchLoaded(units));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
