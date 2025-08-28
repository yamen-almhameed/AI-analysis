enum DetailStatus { active, completed, pending, vip }
enum PaymentType { visa, cash }

class DetailItem {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final String date;
  final double amount;
  final DetailStatus status;
  final Map<String, String> details;

  DetailItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.date,
    required this.amount,
    required this.status,
    required this.details,
  });
}