import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  void _addPlaceScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPlaceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPlaces = ref.watch(userPlaceProvider);

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              _addPlaceScreen(context);
            },
            icon: const Icon(Icons.add))
      ], title: const Text('Your Places')),
      body: PlacesList(places: userPlaces),
    );
  }
}