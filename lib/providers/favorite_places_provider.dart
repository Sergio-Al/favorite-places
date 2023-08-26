import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places_sergio/models/place.dart';

class FavoritePlacesNotifier extends StateNotifier<List<Place>> {
  FavoritePlacesNotifier() : super([]);

  void addNewPlace(String title, File image, PlaceLocation location) {
    final newPlace = Place(name: title, image: image, location: location);
    state = [...state, newPlace];
  }
}

final favoritePlacesProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<Place>>((ref) {
  return FavoritePlacesNotifier();
});
