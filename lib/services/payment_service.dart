import 'package:http/http.dart' as http;
import 'package:vallet_app/models/payment.dart';
import 'dart:convert';

import 'package:vallet_app/utils/constants.dart';

class PaymentService {
  String url = baseUrl + 'payments';

  Future<List> getPayments() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var rb = utf8.decode(response.bodyBytes);

      var list = json.decode(rb) as List;
      return list.map((i) => Payment.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load payments');
    }
  }
}