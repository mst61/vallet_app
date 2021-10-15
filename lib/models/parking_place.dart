class ParkingPlace {

  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final bool active;


  ParkingPlace(this.id, this.name, this.latitude, this.longitude, this.active);

  ParkingPlace.fromJson(Map<dynamic, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = (parsedJson['name'] != null)
            ? parsedJson['name']
            : null,
        latitude = (parsedJson['latitude'] != null)
            ? parsedJson['latitude']
            : null,
        longitude = (parsedJson['longitude'] != null)
            ? parsedJson['longitude']
            : null,
        active = parsedJson['active'];
}
