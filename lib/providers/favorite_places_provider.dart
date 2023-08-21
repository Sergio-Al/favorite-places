import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places_sergio/models/place.dart';

class FavoritePlacesNotifier extends StateNotifier<List<Place>> {
  FavoritePlacesNotifier() : super([]);

  void addNewPlace(Place newPlace) {
    state = [...state, newPlace];
  }
}

final favoritePlacesProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<Place>>((ref) {
  return FavoritePlacesNotifier();
});
