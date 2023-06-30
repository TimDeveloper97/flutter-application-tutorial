import 'package:favorite_places/screens/places_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('No places added yet.'),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(
          places[index].location.address,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return PlaceDetailScreen(place: places[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
