import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vallet_app/models/parking_place.dart';
import 'package:vallet_app/utils/constants.dart';

class ParkingPlaceService {

  String url = baseUrl + '/parking-places';

  Future<List<ParkingPlace>> getParkingPlaces() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var rb = response.bodyBytes;

      var list = json.decode(utf8.decode(rb)) as List;
      List<ParkingPlace> parkingPlaces = list.map((i)=>ParkingPlace.fromJson(i)).toList();
      return parkingPlaces;
    } else {
      throw Exception('Failed to load parking places');
    }
  }
}