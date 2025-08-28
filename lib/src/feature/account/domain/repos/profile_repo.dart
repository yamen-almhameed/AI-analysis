// lib/src/features/account/domain/repositories/profile_repo.dart

import 'package:ai_analysis/src/feature/account/domain/entities/Employee_entity.dart';

abstract class ProfileRepo {
  Future<UserEntity> fetchProfile(int employeeId);
  Future<void> editProfile(int employeeId, UserEntity user);
}
