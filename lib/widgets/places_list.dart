import 'package:favorite_places_sergio/models/place.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  PlacesList({super.key, required this.places, required this.openDetails});

  final List<Place> places;
  void Function(BuildContext context, Place place) openDetails;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.background,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {
            openDetails(context, places[index]);
          },
          child: ListTile(
            title: Text(places[index].name),
          ),
        );
      },
    );
  }
}
