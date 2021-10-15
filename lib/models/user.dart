class User {
  int? id;

  String? name;

  String phoneNumber;

  int? code;

  bool? verified;

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['code'] = this.code;
    data['verified'] = this.verified;
    return data;
  }
}
