import '../../../account/data/model/Employee_model.dart';

class LoginData {
  final String token;
  final UserModel user;

  LoginData({
    required this.token,
    required this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'] ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'UserModel': user.toJson(),
    };
  }
}
