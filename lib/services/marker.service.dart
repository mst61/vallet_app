import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vallet_app/models/parking_place.dart';

class MarkerService {

  List<Marker> getMarkers(List<ParkingPlace> places){
    var markers = <Marker>[];

    places.forEach((place){
      Marker marker = Marker(
          markerId: MarkerId(place.name),
          draggable: false,
          infoWindow: InfoWindow(title: place.name),
          position: LatLng(place.latitude, place.longitude)
      );

      markers.add(marker);
    });

    return markers;
  }
}