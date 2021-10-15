class User {
  late int id;

  String name;

  String phoneNumber;

  late int code;

  late bool verified;

  User(this.id, this.name, this.phoneNumber, this.code, this.verified);

  User.fromNameAndPhoneNumber(String name, String phoneNumber)
      : phoneNumber = phoneNumber,
        name = name;

  User.fromJson(Map<dynamic, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = (parsedJson['name'] != null) ? parsedJson['name'] : null,
        phoneNumber = (parsedJson['phoneNumber'] != null)
            ? parsedJson['phoneNumber']
            : null,
        code = (parsedJson['code'] != null) ? parsedJson['code'] : null,
        verified = parsedJson['verified'];
}
