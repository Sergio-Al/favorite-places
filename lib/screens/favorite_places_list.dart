import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places_sergio/models/place.dart';
import 'package:favorite_places_sergio/screens/place_item.dart';
import 'package:favorite_places_sergio/providers/favorite_places_provider.dart';

import 'package:favorite_places_sergio/screens/new_place.dart';

class FavoritePlacesList extends ConsumerWidget {
  const FavoritePlacesList({super.key});

  void _addNewPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewPlace(),
      ),
    );
  }

  void _openDetails(BuildContext context, Place place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PlaceItem(place: place),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePlaces = ref.watch(favoritePlacesProvider);
    Widget content = const Center(
      child: Text('Nothing here'),
    );

    if (favoritePlaces.isNotEmpty) {
      content = ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onTap: () {
              _openDetails(context, favoritePlaces[index]);
            },
            child: ListTile(
              title: Text(favoritePlaces[index].name),
            ),
          );
        },
      );
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Places'),
        actions: [
          IconButton(
            onPressed: () {
              _addNewPlace(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: content,
      ),
    );
  }
}
