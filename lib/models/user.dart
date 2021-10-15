class User {

  final int id;

  final String name;

  final String phoneNumber;

  final int code;

  final bool verified;

  User(this.id, this.name, this.phoneNumber, this.code,
      this.verified);

  User.fromJson(Map<dynamic, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = (parsedJson['name'] != null)
            ? parsedJson['name']
            : null,
        phoneNumber = (parsedJson['phoneNumber'] != null)
            ? parsedJson['phoneNumber']
            : null,
        code = (parsedJson['code'] != null)
            ? parsedJson['code']
            : null,
        verified = parsedJson['verified'];
}