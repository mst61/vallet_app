class Verify {

  final int code;
  final String phoneNumber;
  final bool success;

  Verify(this.code, this.phoneNumber, this.success);

  Verify.fromJson(Map<dynamic, dynamic> parsedJson)
      : code = (parsedJson['code'] != null)
            ? parsedJson['code']
            : null,
        phoneNumber = (parsedJson['phoneNumber'] != null)
            ? parsedJson['phoneNumber']
            : null,
        success = (parsedJson['success'] != null)
            ? parsedJson['success']
            : null;
}