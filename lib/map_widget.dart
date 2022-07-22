import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class OsmWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OsmWidgetState();
}

class _OsmWidgetState extends State<OsmWidget> {
  MapController controller = MapController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(latitude: 40.7831095, longitude: -73.9773441));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: OsmMap(controller: controller),
          floatingActionButton: _CurrentLocationButton(controller: controller),
        ),
        Positioned(
          bottom: 0,
          left: 5,
          child: CopyrightOSMWidget(),
        )
      ],
    );
  }
}

class _CurrentLocationButton extends StatelessWidget {
  const _CurrentLocationButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MapController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await controller.currentLocation();
      },
      child: Icon(Icons.my_location),
    );
  }
}

class OsmMap extends StatelessWidget {
  const OsmMap({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MapController controller;

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: controller,
      initZoom: 12,
      minZoomLevel: 2,
      maxZoomLevel: 19,
      stepZoom: 2,
    );
  }
}
