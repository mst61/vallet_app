import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vallet_app/models/ticket.dart';
import 'package:vallet_app/utils/constants.dart';

class TicketService {
  String url = baseUrl + '/tickets/';

  Future<Ticket> getTicketById(String ticketId) async {
    var response = await http.get(Uri.parse(url + ticketId));

    if (response.statusCode == 200) {
      return Ticket.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load ticket with id' + ticketId);
    }
  }

  Future<Ticket> getTicketByPlate(String plate) async {
    var response = await http.get(Uri.parse(url + '/plate' + plate));

    if (response.statusCode == 200) {
      return Ticket.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load ticket with plate' + plate);
    }
  }
}
