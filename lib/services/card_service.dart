import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vallet_app/models/credit_card.dart';
import 'package:vallet_app/utils/constants.dart';

class CardService {
  String url = baseUrl + 'cards';

  Future<List> getCards() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var rb = response.body;

      var list = json.decode(rb) as List;
      return list.map((i) => CreditCard.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load cards');
    }
  }
}
