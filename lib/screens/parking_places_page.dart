import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vallet_app/services/parking_place_service.dart';

import 'scan_options_page.dart';

class ParkingPlacesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<ParkingPlacesPage> {
  final parkingPlaceService = new ParkingPlaceService();

  final Map<String, Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/ParkingIcon.png",
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    var parkingPlaces = await parkingPlaceService.getParkingPlaces();
    setState(() {
      _markers.clear();
      for (final parkingPlace in parkingPlaces) {
        final marker = Marker(
          icon: mapMarker,
          markerId: MarkerId(parkingPlace.name),
          position: LatLng(parkingPlace.latitude, parkingPlace.longitude),
          infoWindow: InfoWindow(
            title: parkingPlace.name,
            snippet: parkingPlace.address,
          ),
        );
        _markers[parkingPlace.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          title: Text("Otoparklar"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(19, 60, 83, 1.0),
        ),
        body: Container(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(41.028640547111394, 28.970768432592504),
                zoom: 15,
              ),
              markers: _markers.values.toSet(),
            )));
  }
}
