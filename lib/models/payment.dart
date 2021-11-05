import 'package:intl/intl.dart';
import 'package:vallet_app/models/parking_place.dart';

class Payment {

  final double price;
  final String paymentDate;
  final ParkingPlace? parkingPlace;

  Payment(this.price, this.paymentDate, this.parkingPlace);

  Payment.fromJson(Map<dynamic, dynamic> parsedJson)
      : price = (parsedJson['price'] != null)
      ? parsedJson['price']
      : null,
        paymentDate = DateFormat('yyyy-MM-dd').format(new DateTime.now()),
        parkingPlace = (parsedJson['parkingPlace'] != null)
            ? ParkingPlace.fromJson(parsedJson['parkingPlace'])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['paymentDate'] = this.paymentDate;
    data['parkingPlace'] = this.parkingPlace;
    return data;
  }
}