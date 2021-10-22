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
              snippet: "Fiyat Listesi İçin Dokunun",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 16,
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            //shrinkWrap: true,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Center(
                                child: Text('Fiyat Listesi',
                                    style: TextStyle(fontSize: 20)),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: Text(parkingPlace.name,
                                    style: TextStyle(fontSize: 20)),
                              ),
                              SizedBox(height: 20),
                              _hoursRow('0', '1', 100),
                              _hoursRow('1', '2', 200),
                              _hoursRow('2', '3', 300),
                              _hoursRow('3', '4', 400),
                              _hoursRow('4', '5', 500),
                              _hoursRow('5', '6', 600),
                              _hoursRow('6', '7', 100),
                              _hoursRow('7', '8', 200),
                              _hoursRow('8', '9', 300),
                              _hoursRow('9', '10', 400),
                              _hoursRow('10', '11', 500),
                              _hoursRow('11', '12', 600),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
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

Widget _hoursRow(String first_hour, String second_hour, double price) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Column(
      children: <Widget>[
        SizedBox(height: 12),
        Container(height: 2, color: Color.fromRGBO(19, 101, 148, 1.0)),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            Text(first_hour + " - "),
            Text(second_hour + " saat"),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(19, 101, 148, 1.0),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text('$price' + "  TL",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    ),
  );
}
