class Client {
  final int id;
  final String fullName;
  final String phone;
  final String statusRating;
  final String walletBalance;
  final String? permanentDiscount;
  final String? notes;
  final int entryTimes;
  final int totalServices;

  Client({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.statusRating,
    required this.walletBalance,
    this.permanentDiscount,
    this.notes,
    required this.entryTimes,
    required this.totalServices,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json['id'],
        fullName: json['full_name'],
        phone: json['phone'],
        statusRating: json['status_rating'],
        walletBalance: json['wallet_balance'],
        permanentDiscount: json['permanent_discount'],
        notes: json['notes'],
        entryTimes: json['entry_times'],
        totalServices: json['total_services'],
      );
}
