import 'package:ai_analysis/src/feature/auth/data/model/detail_item_model.dart';
import 'package:ai_analysis/src/feature/auth/data/model/report_model.dart';
import 'package:get/get.dart';

class ReportDetailsController extends GetxController {
  final ReportItem selectedItem;
  final RxList<DetailItem> detailsList = <DetailItem>[].obs;
  final RxBool isLoading = false.obs;
  final RxString totalAmount = '0.00'.obs;
  final RxInt totalCount = 0.obs;

  ReportDetailsController(this.selectedItem);

  @override
  void onInit() {
    super.onInit();
    loadDetails();
  }

  void loadDetails() {
    isLoading.value = true;

    // محاكاة تحميل البيانات
    Future.delayed(Duration(seconds: 1), () {
      detailsList.value = _generateMockData();
      _calculateTotals();
      isLoading.value = false;
    });
  }

  List<DetailItem> _generateMockData() {
    switch (selectedItem.title) {
      case 'خروج المركبات':
        return _generateVehicleExitData();
      case 'دخول المركبات':
        return _generateVehicleEntryData();
      case 'فيزا':
        return _generatePaymentData(PaymentType.visa);
      case 'كاش':
        return _generatePaymentData(PaymentType.cash);
      default:
        return _generateGeneralData();
    }
  }

  List<DetailItem> _generateVehicleExitData() {
    return [
      DetailItem(
        id: 'EX001',
        title: 'تويوتا كامري - أحمد محمد',
        subtitle: 'رقم اللوحة: 123-456',
        time: '14:30',
        date: '2024-01-15',
        amount: 0.0,
        status: DetailStatus.completed,
        details: {
          'وقت الدخول': '08:30',
          'وقت الخروج': '14:30',
          'طريقة الدفع': 'كاش',
        },
      ),
      DetailItem(
        id: 'EX002',
        title: 'هوندا أكورد - سارة أحمد',
        subtitle: 'رقم اللوحة: 789-012',
        time: '16:45',
        date: '2024-01-15',
        amount: 0.0,
        status: DetailStatus.completed,
        details: {
          'وقت الدخول': '12:15',
          'وقت الخروج': '16:45',
          'طريقة الدفع': 'فيزا',
        },
      ),
      DetailItem(
        id: 'EX003',
        title: 'BMW X5 - محمد علي',
        subtitle: 'رقم اللوحة: 345-678',
        time: '18:20',
        date: '2024-01-15',
        amount: 0.0,
        status: DetailStatus.vip,
        details: {
          'وقت الدخول': '10:00',
          'وقت الخروج': '18:20',
          'طريقة الدفع': 'فيزا',
        },
      ),
    ];
  }

  List<DetailItem> _generateVehicleEntryData() {
    return [
      DetailItem(
        id: 'EN001',
        title: 'نيسان التيما - خالد سعد',
        subtitle: 'رقم اللوحة: 901-234',
        time: '09:15',
        date: '2024-01-15',
        amount: 0.0,
        status: DetailStatus.active,
        details: {
          'وقت الدخول': '09:15',
          'نوع الموقف': 'عادي',
          'المدة المتوقعة': '4 ساعات',
        },
      ),
      DetailItem(
        id: 'EN002',
        title: 'مرسيدس C200 - فاطمة محمد',
        subtitle: 'رقم اللوحة: 567-890',
        time: '11:30',
        date: '2024-01-15',
        amount: 0.0,
        status: DetailStatus.vip,
        details: {
          'وقت الدخول': '11:30',
          'نوع الموقف': 'VIP',
          'المدة المتوقعة': '6 ساعات',
        },
      ),
    ];
  }

  List<DetailItem> _generatePaymentData(PaymentType type) {
    String paymentMethod = type == PaymentType.visa ? 'فيزا' : 'كاش';
    return [
      DetailItem(
        id: 'PAY001',
        title: 'دفعة من أحمد محمد',
        subtitle: 'تويوتا كامري - 123-456',
        time: '14:30',
        date: '2024-01-15',
        amount: 25.0,
        status: DetailStatus.completed,
        details: {
          'طريقة الدفع': paymentMethod,
          'رقم التذكرة': 'TK-001',
          'مدة الإقامة': '6 ساعات',
          if (type == PaymentType.visa) 'رقم المرجع': 'REF123456',
        },
      ),
      DetailItem(
        id: 'PAY002',
        title: 'دفعة من سارة أحمد',
        subtitle: 'هوندا أكورد - 789-012',
        time: '16:45',
        date: '2024-01-15',
        amount: 15.0,
        status: DetailStatus.completed,
        details: {
          'طريقة الدفع': paymentMethod,
          'رقم التذكرة': 'TK-002',
          'مدة الإقامة': '4.5 ساعات',
          if (type == PaymentType.visa) 'رقم المرجع': 'REF789012',
        },
      ),
    ];
  }

  List<DetailItem> _generateGeneralData() {
    return [
      DetailItem(
        id: 'GEN001',
        title: 'عنصر ${selectedItem.title}',
        subtitle: 'تفاصيل العنصر الأول',
        time: '12:00',
        date: '2024-01-15',
        amount: 0.0,
        status: DetailStatus.completed,
        details: {
          'النوع': selectedItem.title,
          'الحالة': 'مكتمل',
          'الملاحظات': 'لا توجد ملاحظات',
        },
      ),
    ];
  }

  void _calculateTotals() {
    totalCount.value = detailsList.length;
    double total = detailsList.fold(0.0, (sum, item) => sum + item.amount);
    totalAmount.value = total.toStringAsFixed(2);
  }
}
