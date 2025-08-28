class EmployeeProfile {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String type;
  final String walletBalance;
  final int isActive;
  final String? photo;
  final String rating;
  final String address;
  final String locationUrl;
  final String? idImage;
  final String? clearanceCertificate;
  final String? drivingLicense;
  final String? policies;
  final String salary;
  final String? workingPeriodFrom;
  final String? workingPeriodTo;
  final String specialTasks;
  final DateTime createdAt;
  final DateTime updatedAt;

  EmployeeProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    required this.walletBalance,
    required this.isActive,
    this.photo,
    required this.rating,
    required this.address,
    required this.locationUrl,
    this.idImage,
    this.clearanceCertificate,
    this.drivingLicense,
    this.policies,
    required this.salary,
    this.workingPeriodFrom,
    this.workingPeriodTo,
    required this.specialTasks,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EmployeeProfile.fromJson(Map<String, dynamic> json) {
    return EmployeeProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      type: json['type'],
      walletBalance: json['wallet_balance'],
      isActive: json['is_active'],
      photo: json['photo'],
      rating: json['rating'],
      address: json['address'],
      locationUrl: json['location_url'],
      idImage: json['id_image'],
      clearanceCertificate: json['clearance_certificate'],
      drivingLicense: json['driving_license'],
      policies: json['policies'],
      salary: json['salary'],
      workingPeriodFrom: json['working_period_from'],
      workingPeriodTo: json['working_period_to'],
      specialTasks: json['special_tasks'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
