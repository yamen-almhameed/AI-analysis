import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleUser {
  final String owner;
  final String phone;
  final String? note;
  final String? source;

  VehicleUser({
    required this.owner,
    required this.phone,
    this.note,
    this.source,
  });
}

class Vehicle {
  final String number;
  final String vehicleType;
  final List<VehicleUser> users;

  Vehicle({
    required this.number,
    required this.vehicleType,
    required this.users,
  });
}

class RegCarController extends GetxController {
  // Controllers
  final vehicleNumberController = TextEditingController();
  final vehicleTypeController = TextEditingController();
  final ownerController = TextEditingController();
  final phoneController = TextEditingController();
  final noteController = TextEditingController();
  final dateController = TextEditingController();
  final dateExitCarController = TextEditingController();
  RxString selectedSource = ''.obs;
  RxBool addNewCar = false.obs;
  RxBool addNewUser = false.obs;
  bool hasCarKey = false;
  bool isServiceSelected = false;
  bool hasRequest = false;
  List<String> get uniqueCars => availableCars.toSet().toList();

  Vehicle? selectedVehicle;
  VehicleUser? selectedUser;

  List<String> availableCars = ["تويوتا", "هيونداي", "كيا", "مرسيدس"];
  List<String> sourceOptions = ['فيسبوك', 'إنستغرام', 'جوجل', 'صديق'];

  List<Vehicle> vehicles = [
    Vehicle(
      number: '123456',
      vehicleType: 'تويوتا',
      users: [
        VehicleUser(
          owner: 'أحمد علي محمد',
          phone: '0791234567',
          source: 'فيسبوك',
        ),
      ],
    ),
    Vehicle(
      number: '987654',
      vehicleType: 'هيونداي',
      users: [
        VehicleUser(
          owner: 'سارة أحمد حسن',
          phone: '0791112223',
          source: 'إنستغرام',
        ),
      ],
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    vehicleNumberController.addListener(
      () => searchVehicle(vehicleNumberController.text),
    );
  }

  void searchVehicle(String number) {
    selectedVehicle = vehicles.firstWhereOrNull((v) => v.number == number);
    selectedUser = null;
    _clearUserFields();
    update();
  }

  void selectUser(VehicleUser user) {
    selectedUser = user;
    ownerController.text = user.owner;
    phoneController.text = user.phone;
    noteController.text = user.note ?? '';
    selectedSource.value = user.source ?? '';
    vehicleTypeController.text = selectedVehicle?.vehicleType ?? '';
    addNewUser.value = false;
    update();
  }

  void addNewUserToVehicle() {
    if (selectedVehicle == null) return;

    final newUser = VehicleUser(
      owner: ownerController.text.trim(),
      phone: phoneController.text.trim(),
      note: noteController.text.trim().isEmpty
          ? null
          : noteController.text.trim(),
      source: selectedSource.value.isEmpty ? null : selectedSource.value,
    );

    // تحقق من وجود المستخدم مسبقاً بنفس الاسم أو الرقم
    final exists = selectedVehicle!.users.any(
      (u) =>
          u.owner.toLowerCase() == newUser.owner.toLowerCase() ||
          u.phone == newUser.phone,
    );

    if (exists) {
      Get.snackbar(
        'خطأ',
        'المستخدم موجود بالفعل',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // أضف المستخدم الجديد
    selectedVehicle!.users.add(newUser);
    Get.snackbar(
      'نجح الإضافة',
      'تم إضافة المستخدم بنجاح للمركبة الحالية',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // إعادة تهيئة حقول المستخدم لإدخال مستخدم جديد إذا أحب المستخدم
    _clearUserFields();
    addNewUser.value = false;
    update();
  }

  void toggleAddNewUser(bool? value) {
    addNewUser.value = value ?? false;
    if (addNewUser.value) {
      selectedUser = null;
      _clearUserFields();
    }
    update();
  }

  void toggleAddNewCar(bool? value) => addNewCar.value = value ?? false;

  bool saveData() {
    if (!_validateData()) return false;

    final newUser = VehicleUser(
      owner: ownerController.text.trim(),
      phone: phoneController.text.trim(),
      note: noteController.text.trim().isEmpty
          ? null
          : noteController.text.trim(),
      source: selectedSource.value.isEmpty ? null : selectedSource.value,
    );

    if (selectedVehicle != null) {
      selectedVehicle!.users.add(newUser);
      ;
    } else {
      final newVehicle = Vehicle(
        number: vehicleNumberController.text.trim(),
        vehicleType: vehicleTypeController.text.trim(),
        users: [newUser],
      );
      vehicles.add(newVehicle);
    }

    Get.snackbar(
      'تم الحفظ',
      'تمت العملية بنجاح',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    _resetForm();
    return true;
  }

  bool _validateData() {
    if (vehicleNumberController.text.isEmpty ||
        ownerController.text.isEmpty ||
        phoneController.text.isEmpty ||
        vehicleTypeController.text.isEmpty ||
        selectedSource.value.isEmpty ||
        ownerController.text.split(' ').length < 3) {
      Get.snackbar(
        'خطأ',
        'يرجى إدخال جميع البيانات بشكل صحيح',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (selectedVehicle != null) {
      final exists = selectedVehicle!.users.any(
        (u) =>
            u.owner.toLowerCase() ==
                ownerController.text.trim().toLowerCase() ||
            u.phone == phoneController.text.trim(),
      );
      if (exists) {
        Get.snackbar(
          'خطأ',
          'المستخدم موجود بالفعل',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }
    }

    return true;
  }

  void addCarToList(String carName) {
    if (carName.isEmpty) return;
    if (!availableCars.contains(carName)) {
      availableCars.add(carName);
      Get.snackbar(
        'تم الإضافة',
        'تم إضافة السيارة "$carName" للقائمة',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.primaryColor,
        colorText: Get.theme.colorScheme.onPrimary,
      );
      update();
    }
  }

  void _clearUserFields() {
    ownerController.clear();
    phoneController.clear();
    noteController.clear();
    selectedSource.value = '';
  }

  void _resetForm() {
    vehicleNumberController.clear();
    vehicleTypeController.clear();
    _clearUserFields();
    selectedVehicle = null;
    selectedUser = null;
    addNewCar.value = false;
    addNewUser.value = false;
    update();
  }

  @override
  void onClose() {
    vehicleNumberController.dispose();
    vehicleTypeController.dispose();
    ownerController.dispose();
    phoneController.dispose();
    noteController.dispose();
    super.onClose();
  }

  void toggleCarKey(bool? value) {
    hasCarKey = value ?? false;
    update();
  }

  void toggleServiceSelection(bool? value) {
    isServiceSelected = value ?? false;
    update();
  }

  void toggleRequest(bool? value) {
    hasRequest = value ?? false;
    update();
  }
}
