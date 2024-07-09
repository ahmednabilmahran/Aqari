import 'package:aqari/apis/units_api.dart';
import 'package:aqari/models/unit_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

/// FavoritesCubit class
class FavoritesCubit extends Cubit<FavoritesState> {
  /// FavoritesCubit constructor
  FavoritesCubit(this.api) : super(FavoritesInitial());

  /// UnitsApi instance
  final UnitsApi api;

  /// List of all favorites
  List<UnitModel> _allFavorites = [];

  /// Fetch favorites for a specific user
  Future<void> fetchFavorites(String userId) async {
    try {
      emit(FavoritesLoading());
      final favorites = await api.getFavoriteUnits(userId);
      _allFavorites = favorites;
      emit(FavoritesLoaded(favorites));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  /// Filter favorites by category
  void filterFavorites(String category) {
    if (category == 'All') {
      emit(FavoritesLoaded(_allFavorites));
    } else {
      final filteredFavorites =
          _allFavorites.where((unit) => unit.type == category).toList();
      emit(FavoritesLoaded(filteredFavorites));
    }
  }
}
