class Ticket {
  final int ticketId;
  final String ticketNumber;
  final String clientName;
  final String vehicleNumber;
  final String vehicleType;
  final String? entryTime;
  final String? actualExitTime;
  final String? expectedExitTime;
  final bool late;
  final String? lateMessage;
  final String? lateDuration;
  final String? serviceName;
  final String serviceCompleted;
  final String computedStatus;
  final String? amanat;
  final String? notes;
  final String statusRating;
  final String? client_notes;
  Ticket({
    required this.ticketId,
    required this.ticketNumber,
    required this.clientName,
    required this.vehicleNumber,
    required this.vehicleType,
    this.entryTime,
    this.actualExitTime,
    this.expectedExitTime,
    required this.late,
    this.lateMessage,
    this.lateDuration,
    this.serviceName,
    required this.serviceCompleted,
    required this.computedStatus,
    this.amanat,
    this.notes,
    required this.statusRating,
    this.client_notes,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      ticketId: json['ticket_id'],
      ticketNumber: json['ticket_number'],
      clientName: json['client_name'],
      vehicleNumber: json['vehicle_number'],
      vehicleType: json['vehicle_type'],
      entryTime: json['entry_time'],
      actualExitTime: json['actual_exit_time'],
      expectedExitTime: json['expected_exit_time'],
      late: json['late'] ?? false,
      lateMessage: json['late_message'],
      lateDuration: json['late_duration'],
      serviceName: json['service_name'],
      serviceCompleted: json['service_completed'],
      computedStatus: json['computed_status'],
      amanat: json['amanat'],
      notes: json['notes'],
      statusRating: json['status_rating'],
      client_notes: json['client_notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ticket_id": ticketId,
      "ticket_number": ticketNumber,
      "client_name": clientName,
      "vehicle_number": vehicleNumber,
      "vehicle_type": vehicleType,
      "entry_time": entryTime,
      "actual_exit_time": actualExitTime,
      "expected_exit_time": expectedExitTime,
      "late": late,
      "late_message": lateMessage,
      "late_duration": lateDuration,
      "service_name": serviceName,
      "service_completed": serviceCompleted,
      "computed_status": computedStatus,
      "amanat": amanat,
      "notes": notes,
      "status_rating": statusRating,
      "client_notes": client_notes,
    };
  }
}
