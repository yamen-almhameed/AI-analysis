// lib/src/core/constants/api_constants.dart
class ApiConstants {
  // 🔗 الرابط الأساسي
  static const String baseUrl = "https://ia.metafortech.com/api/";

  // =====================
  // 🟦 Authentication
  // =====================
  static const String login = 'login';

  // =====================
  // 🟩 Tickets
  // =====================
  static const String tickets = 'tickets';
  static String ticketsByVehicleType(String vehicleType) =>
      'tickets?vehicle_type=$vehicleType';
  static String ticketsByClientName(String name) => 'tickets?client_name=$name';
  static String ticketsSorted(String order) => 'tickets?sort=$order';

  // =====================
  // 🟨 Clients
  // =====================
  static String clientTickets(int clientId) => 'clients/$clientId/tickets';

  // =====================
  // 🟥 Employees
  // =====================
  static String employee(int id) => 'employee/$id';
  static String employees(int id) => 'employees/$id';
}
