class Register {
  String name;
  String email;
  String password;
  String deviceType;
  String message;
  //Register._({this.name, this.email, this.password, this.deviceType});

  factory Register.fromJson(Map<String, dynamic> json) {
    return new Register._(name: json['message']);
  }

  Register._({String name, String email, String password, String deviceType}) {
    this.name = name;
    this.email = email;
    this.password = password;
    this.deviceType = deviceType;
  }




  Map toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    map["deviceType"] = deviceType;

    return map;
  }
}
