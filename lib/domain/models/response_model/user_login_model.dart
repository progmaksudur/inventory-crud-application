class UserModel {
  final String username;
  final String password;
  final bool rememberMe;

  UserModel({
    required this.username,
    required this.password,
    required this.rememberMe,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      password: json['password'],
      rememberMe: json['rememberMe'],
    );
  }

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'rememberMe': rememberMe,
  };
}