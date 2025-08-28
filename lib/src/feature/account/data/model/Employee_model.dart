import 'package:ai_analysis/src/feature/account/domain/entities/Employee_entity.dart';


class UserModel extends UserEntity {
  UserModel({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String countryCode,
    int? employeeId,
    String? address,
    double? salary,
    String? specialTasks,
    String? type,
    double? rating,
    double? walletBalance,
    bool? isActive,
    String? locationUrl,
  }) : super(
          id: id,
          name: name,
          email: email,
          phone: phone,
          countryCode: countryCode,
          employeeId: employeeId,
          address: address,
          salary: salary,
          specialTasks: specialTasks,
          type: type,
          rating: rating,
          walletBalance: walletBalance,
          isActive: isActive,
          locationUrl: locationUrl,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      countryCode: json['country_code'] ?? '+962',
      employeeId: json['employee_id'],
      address: json['address'],
      salary: double.tryParse(json['salary']?.toString() ?? '0'),
      specialTasks: json['special_tasks'],
      type: json['type'],
      rating: double.tryParse(json['rating']?.toString() ?? '0'),
      walletBalance: double.tryParse(json['wallet_balance']?.toString() ?? '0'),
      isActive: json['is_active'] == 1,
      locationUrl: json['location_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
      'employee_id': employeeId,
      'address': address,
      'salary': salary,
      'special_tasks': specialTasks,
      'type': type,
      'rating': rating,
      'wallet_balance': walletBalance,
      'is_active': isActive == true ? 1 : 0,
      'location_url': locationUrl,
    };
  }
}
