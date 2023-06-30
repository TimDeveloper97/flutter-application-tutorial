import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapsScreen extends StatefulWidget {
  final PlaceLocation location;
  final bool isSelecting;

  const MapsScreen({
    super.key,
    this.location = const PlaceLocation(37.422, -122.084, ''),
    this.isSelecting = true,
  });
  @override
  State<StatefulWidget> createState() {
    return _MapsScreenState();
  }
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your location' : 'your location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.latitude, widget.location.longitude),
          zoom: 16,
        ),
        markers: {
          Marker(
              markerId: const MarkerId('m1'),
              position:
                  LatLng(widget.location.latitude, widget.location.longitude)),
        },
      ),
    );
  }
}
