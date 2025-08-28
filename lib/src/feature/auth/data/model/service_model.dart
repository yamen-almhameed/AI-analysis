class ServiceModel {
  final int id;
  final int? clientId;
  final String name;
  final String? icon;
  final String price;
  final String type;
  final int isActive;
  final int serviceCategoryId;
  final int requestsCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int executionTime;
  final DateTime? expectedStartTime;

  ServiceModel({
    required this.id,
    this.clientId,
    required this.name,
    this.icon,
    required this.price,
    required this.type,
    required this.isActive,
    required this.serviceCategoryId,
    required this.requestsCount,
    required this.createdAt,
    required this.updatedAt,
    required this.executionTime,
    this.expectedStartTime,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json['id'],
    clientId: json['client_id'],
    name: json['name'],
    icon: json['icon'],
    price: json['price'],
    type: json['type'],
    isActive: json['is_active'],
    serviceCategoryId: json['service_category_id'],
    requestsCount: json['requests_count'],
    createdAt: DateTime.parse(json['created_at']),
    updatedAt: DateTime.parse(json['updated_at']),
    executionTime: json['execution_time'],
    expectedStartTime: json['expected_start_time'] != null
        ? DateTime.parse(json['expected_start_time'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'client_id': clientId,
    'name': name,
    'icon': icon,
    'price': price,
    'type': type,
    'is_active': isActive,
    'service_category_id': serviceCategoryId,
    'requests_count': requestsCount,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'execution_time': executionTime,
    'expected_start_time': expectedStartTime != null
        ? expectedStartTime!.toIso8601String()
        : null,
  };
}
