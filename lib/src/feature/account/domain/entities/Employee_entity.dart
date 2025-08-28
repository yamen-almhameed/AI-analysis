// lib/src/features/account/domain/entities/user_entity.dart
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String countryCode;
  final int? employeeId;
  final String? address;
  final double? salary;
  final String? specialTasks;
  final String? type;
  final double? rating;
  final double? walletBalance;
  final bool? isActive;
  final String? locationUrl;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
    this.employeeId,
    this.address,
    this.salary,
    this.specialTasks,
    this.type,
    this.rating,
    this.walletBalance,
    this.isActive,
    this.locationUrl,
  });
}
