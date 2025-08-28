import 'package:ai_analysis/src/core/network/apiclient.dart';
import 'package:ai_analysis/src/core/resources/api_constants.dart';

class ProfileDataSource {
  /// جلب بيانات الموظف
  Future<Map<String, dynamic>> fetchProfile(int employeeId) async {
    final res = await ApiClient.dio.get(ApiConstants.employees(employeeId));
    if (res.statusCode == 200 && res.data['status'] == true) {
      return res.data['data'];
    } else {
      throw Exception('Failed to fetch profile');
    }
  }

  /// تعديل بيانات الموظف
  Future<Map<String, dynamic>> editProfile(
    int employeeId,
    Map<String, dynamic> data,
  ) async {
    final res = await ApiClient.dio.put(
      ApiConstants.employee(employeeId),
      data: data,
    );
    if (res.statusCode == 200 && res.data['employee'] != null) {
      return res.data['employee'];
    } else {
      throw Exception('Failed to update profile');
    }
  }
}
