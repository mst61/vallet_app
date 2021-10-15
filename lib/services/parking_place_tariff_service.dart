import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vallet_app/models/parking_place_tariff.dart';
import 'package:vallet_app/utils/constants.dart';

class ParkingPlaceTariffService {
  String url = baseUrl + '/parking-place-tariffs';

  Future<ParkingPlaceTariff> getParkingPlacesTariff(int parkingPlaceId) async {
    var response = await http
        .get(Uri.parse(url + '/parking-place/' + parkingPlaceId.toString()));

    if (response.statusCode == 200) {
      return ParkingPlaceTariff.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load parking place tariff with id' + parkingPlaceId.toString());
    }
  }
}
