import 'login_data.dart';

class LoginResponse {
  final String message;
  final LoginData data;

  LoginResponse({
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] ?? '',
      data: LoginData.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      ...data.toJson(),
    };
  }
}
