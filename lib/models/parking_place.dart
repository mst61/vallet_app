import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingPlace {
  final int id;
  final String name;
  final String? address;
  final double latitude;
  final double longitude;
  final bool active;

  ParkingPlace(this.id, this.name, this.address, this.latitude, this.longitude, this.active);

  ParkingPlace.fromJson(Map<dynamic, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = (parsedJson['name'] != null) ? parsedJson['name'] : null,
        address = (parsedJson['address'] != null) ? parsedJson['address'] : null,
        latitude =
            (parsedJson['latitude'] != null) ? parsedJson['latitude'] : null,
        longitude =
            (parsedJson['longitude'] != null) ? parsedJson['longitude'] : null,
        active = parsedJson['active'];
}
