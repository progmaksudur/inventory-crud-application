class UserProfileData {
  UserProfileData({
      num? id, 
      String? login, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? phone, 
      String? imageUrl, 
      bool? activated, 
      String? langKey, 
      String? createdBy, 
      dynamic createdDate, 
      String? lastModifiedBy, 
      String? lastModifiedDate, 
      List<String>? authorities,}){
    _id = id;
    _login = login;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _imageUrl = imageUrl;
    _activated = activated;
    _langKey = langKey;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _lastModifiedBy = lastModifiedBy;
    _lastModifiedDate = lastModifiedDate;
    _authorities = authorities;
}

  UserProfileData.fromJson(dynamic json) {
    _id = json['id'];
    _login = json['login'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _phone = json['phone'];
    _imageUrl = json['imageUrl'];
    _activated = json['activated'];
    _langKey = json['langKey'];
    _createdBy = json['createdBy'];
    _createdDate = json['createdDate'];
    _lastModifiedBy = json['lastModifiedBy'];
    _lastModifiedDate = json['lastModifiedDate'];
    _authorities = json['authorities'] != null ? json['authorities'].cast<String>() : [];
  }
  num? _id;
  String? _login;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _imageUrl;
  bool? _activated;
  String? _langKey;
  String? _createdBy;
  dynamic _createdDate;
  String? _lastModifiedBy;
  String? _lastModifiedDate;
  List<String>? _authorities;
UserProfileData copyWith({  num? id,
  String? login,
  String? firstName,
  String? lastName,
  String? email,
  String? phone,
  String? imageUrl,
  bool? activated,
  String? langKey,
  String? createdBy,
  dynamic createdDate,
  String? lastModifiedBy,
  String? lastModifiedDate,
  List<String>? authorities,
}) => UserProfileData(  id: id ?? _id,
  login: login ?? _login,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  phone: phone ?? _phone,
  imageUrl: imageUrl ?? _imageUrl,
  activated: activated ?? _activated,
  langKey: langKey ?? _langKey,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  lastModifiedBy: lastModifiedBy ?? _lastModifiedBy,
  lastModifiedDate: lastModifiedDate ?? _lastModifiedDate,
  authorities: authorities ?? _authorities,
);
  num? get id => _id;
  String? get login => _login;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get imageUrl => _imageUrl;
  bool? get activated => _activated;
  String? get langKey => _langKey;
  String? get createdBy => _createdBy;
  dynamic get createdDate => _createdDate;
  String? get lastModifiedBy => _lastModifiedBy;
  String? get lastModifiedDate => _lastModifiedDate;
  List<String>? get authorities => _authorities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['login'] = _login;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['imageUrl'] = _imageUrl;
    map['activated'] = _activated;
    map['langKey'] = _langKey;
    map['createdBy'] = _createdBy;
    map['createdDate'] = _createdDate;
    map['lastModifiedBy'] = _lastModifiedBy;
    map['lastModifiedDate'] = _lastModifiedDate;
    map['authorities'] = _authorities;
    return map;
  }

}