class ParkingPlaceTariff {

  final int id;

  final String explanation;

  final double value;

  final String currency;

  ParkingPlaceTariff(this.id, this.explanation, this.value, this.currency);

  ParkingPlaceTariff.fromJson(Map<dynamic, dynamic> parsedJson)
      : id = parsedJson['id'],
        explanation = (parsedJson['explanation'] != null)
            ? parsedJson['explanation']
            : null,
        value = (parsedJson['value'] != null)
            ? parsedJson['value']
            : null,
        currency = (parsedJson['currency'] != null)
            ? parsedJson['currency']
            : null;
}