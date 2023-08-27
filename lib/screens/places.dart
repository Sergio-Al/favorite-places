import 'package:favorite_places_sergio/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places_sergio/models/place.dart';
import 'package:favorite_places_sergio/screens/place_item.dart';
import 'package:favorite_places_sergio/providers/favorite_places_provider.dart';

import 'package:favorite_places_sergio/screens/add_place.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() {
    return _PlacesScreenState();
  }
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(favoritePlacesProvider.notifier).loadPlaces();
  }

  void _addNewPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddPlaceScreen(),
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
  Widget build(BuildContext context) {
    final favoritePlaces = ref.watch(favoritePlacesProvider);
    Widget content = const Center(
      child: Text('Nothing here'),
    );

    if (favoritePlaces.isNotEmpty) {
      content = PlacesList(
        places: favoritePlaces,
        openDetails: _openDetails,
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
        child: FutureBuilder(
          future: _placesFuture,
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : PlacesList(places: favoritePlaces, openDetails: _openDetails),
        ),
      ),
    );
  }
}
