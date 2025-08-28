import 'dart:developer';
import 'package:ai_analysis/src/feature/account/data/data_soruse/edit_profile.dart';
import 'package:ai_analysis/src/feature/account/data/model/Employee_model.dart';
import 'package:ai_analysis/src/feature/account/data/repos/profile_repo_impl.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  final ProfileRepoImpl repo = ProfileRepoImpl(dataSource: ProfileDataSource());

  // البيانات الرئيسية
  RxString name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var countryCode = '+962'.obs; // سيتم تعيينه تلقائيًا
  var address = ''.obs;
  var salary = 0.0.obs;
  var specialTasks = ''.obs;
  var type = ''.obs;
  var rating = 0.0.obs;
  RxDouble walletBalance = 0.0.obs;
  var terms = 'الاحكام والسياسات';
  var isActive = true.obs;
  var locationUrl = ''.obs;
  var isLoading = true.obs;

  // TextControllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final salaryController = TextEditingController();
  final tasksController = TextEditingController();
  final typeController = TextEditingController();
  final ratingController = TextEditingController();
  final walletController = TextEditingController();
  final isActiveController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchProfile(4);
  }

  Future<void> fetchProfile(int employeeId) async {
    try {
      isLoading.value = true;
      final user = await repo.fetchProfile(employeeId);

      // استخراج الرمز والرقم
      if (user.phone.length > 3) {
        countryCode.value = '+${user.phone.substring(0, 3)}';
        phone.value = user.phone.substring(3); // باقي الرقم بدون الرمز
      } else {
        countryCode.value = '+962'; // افتراضي
        phone.value = user.phone;
      }

      name.value = user.name;
      email.value = user.email;
      type.value = user.type ?? '';
      walletBalance.value = user.walletBalance ?? 0;
      isActive.value = user.isActive ?? true;
      address.value = user.address ?? '';
      salary.value = user.salary ?? 0;
      specialTasks.value = user.specialTasks ?? '';
      rating.value = user.rating ?? 0;
      locationUrl.value = user.locationUrl ?? '';

      // تعيين النصوص في TextControllers
      nameController.text = name.value;
      emailController.text = email.value;
      phoneController.text = phone.value;
      typeController.text = type.value;
      walletController.text = walletBalance.value.toString();
      addressController.text = address.value;
      salaryController.text = salary.value.toString();
      tasksController.text = specialTasks.value;
      locationController.text = locationUrl.value;
      ratingController.text = rating.value.toString();
      isActiveController.text = isActive.value ? "نشط" : "غير نشط";
    } catch (e) {
      log("Error fetching profile: $e");
      Get.snackbar("خطأ", "فشل تحميل بيانات الملف الشخصي");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> editProfile(int employeeId) async {
    try {
      isLoading.value = true;
      final user = UserModel(
        id: employeeId,
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        countryCode: countryCode.value, // هنا نستخدم القيمة التلقائية
        address: addressController.text,
        salary: double.tryParse(salaryController.text),
        specialTasks: tasksController.text,
        type: typeController.text,
        rating: double.tryParse(ratingController.text),
        walletBalance: double.tryParse(walletController.text),
        isActive: isActiveController.text == "نشط",
        locationUrl: locationController.text,
      );

      await repo.editProfile(employeeId, user);

      // تحديث القيم بعد التعديل
      name.value = nameController.text;
      email.value = emailController.text;
      phone.value = phoneController.text;
      type.value = typeController.text;
      walletBalance.value = double.tryParse(walletController.text) ?? 0;
      address.value = addressController.text;
      salary.value = double.tryParse(salaryController.text) ?? 0;
      specialTasks.value = tasksController.text;
      locationUrl.value = locationController.text;
      rating.value = double.tryParse(ratingController.text) ?? 0;
      isActive.value = isActiveController.text == "نشط";

      Get.snackbar(
        "نجاح",
        "تم حفظ التغييرات",
        backgroundColor: const Color(0xFFFF9F43),
        colorText: Colors.white,
      );
    } catch (e) {
      log("Error editing profile: $e");
      Get.snackbar("خطأ", "حدث خطأ أثناء تعديل الملف الشخصي");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    salaryController.dispose();
    tasksController.dispose();
    typeController.dispose();
    ratingController.dispose();
    walletController.dispose();
    isActiveController.dispose();
    locationController.dispose();
    super.onClose();
  }
}
