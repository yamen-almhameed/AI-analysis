class Car {
  final int id;
  final int clientId;
  final String carNumber;
  final String type;
  final int? passengerCapacity;
  final String? color;
  final String? photo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool late;
  final String? lateMessage;
  final String? lateDuration;

  Car({
    required this.id,
    required this.clientId,
    required this.carNumber,
    required this.type,
    this.passengerCapacity,
    this.color,
    this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.late,
    this.lateMessage,
    this.lateDuration,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json['id'],
        clientId: json['client_id'],
        carNumber: json['car_number'],
        type: json['type'],
        passengerCapacity: json['passenger_capacity'],
        color: json['color'],
        photo: json['photo'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        late: json['late'],
        lateMessage: json['late_message'],
        lateDuration: json['late_duration'],
      );
  
  Map<String, dynamic> toJson() => {
        'id': id,
        'client_id': clientId,
        'car_number': carNumber,
        'type': type,
        'passenger_capacity': passengerCapacity,
        'color': color,
        'photo': photo,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'late': late,
        'late_message': lateMessage,
        'late_duration': lateDuration,
      };
}