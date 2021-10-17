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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['code'] = this.code;
    data['success'] = this.success;
    return data;
  }
}