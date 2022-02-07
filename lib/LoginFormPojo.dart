class LoginFormPojo {
  LoginFormPojo({
      String? name, 
      String? gender, 
      String? email, 
      String? country, 
      String? language,}){
    _name = name;
    _gender = gender;
    _email = email;
    _country = country;
    _language = language;
}

  LoginFormPojo.fromJson(dynamic json) {
    _name = json['name'];
    _gender = json['gender'];
    _email = json['email'];
    _country = json['country'];
    _language = json['language'];
  }
  String? _name;
  String? _gender;
  String? _email;
  String? _country;
  String? _language;

  String? get name => _name;
  String? get gender => _gender;
  String? get email => _email;
  String? get country => _country;
  String? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['gender'] = _gender;
    map['email'] = _email;
    map['country'] = _country;
    map['language'] = _language;
    return map;
  }

}