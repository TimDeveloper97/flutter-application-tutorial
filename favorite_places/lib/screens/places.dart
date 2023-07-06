import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PlacesScreenState();
  }
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;

  void _addPlaceScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPlaceScreen(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placesFuture = ref.read(userPlaceProvider.notifier).loadPlace();
  }

  @override
  Widget build(BuildContext context) {
    var userPlaces = ref.watch(userPlaceProvider);

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              _addPlaceScreen(context);
            },
            icon: const Icon(Icons.add))
      ], title: const Text('Your Places')),
      body: FutureBuilder(
        future: _placesFuture,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : PlacesList(
                    places: userPlaces,
                  ),
      ),
    );
  }
}
