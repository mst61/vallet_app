class Ticket {

  final String ticketId;
  final String plate;
  final DateTime? entranceDate;
  final DateTime? exitDate;
  final double price;
  final bool paid;


  Ticket(this.ticketId, this.plate, this.entranceDate, this.exitDate,
      this.price, this.paid);

  Ticket.fromJson(Map<dynamic, dynamic> parsedJson)
      : ticketId = (parsedJson['ticketId'] != null)
      ? parsedJson['ticketId']
      : null,
        plate = (parsedJson['plate'] != null)
            ? parsedJson['plate']
            : null,
        entranceDate = (parsedJson['entranceDate'] != null)
            ? DateTime.tryParse(parsedJson['entranceDate'])
            : null,
        exitDate = (parsedJson['exitDate'] != null)
            ? DateTime.tryParse(parsedJson['exitDate'])
            : null,
        price = (parsedJson['price'] != null)
            ? parsedJson['price']
            : null,
        paid = (parsedJson['paid'] != null)
            ? parsedJson['paid']
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticketId'] = this.ticketId;
    data['plate'] = this.plate;
    data['entranceDate'] = this.entranceDate;
    data['exitDate'] = this.exitDate;
    data['price'] = this.price;
    data['paid'] = this.paid;
    return data;
  }
}