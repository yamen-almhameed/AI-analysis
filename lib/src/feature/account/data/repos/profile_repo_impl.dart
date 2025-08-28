
import 'package:ai_analysis/src/feature/account/data/data_soruse/edit_profile.dart';
import 'package:ai_analysis/src/feature/account/data/model/Employee_model.dart';
import 'package:ai_analysis/src/feature/account/domain/entities/Employee_entity.dart';
import 'package:ai_analysis/src/feature/account/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource dataSource;

  ProfileRepoImpl({required this.dataSource});

  @override
  Future<UserEntity> fetchProfile(int employeeId) async {
    final data = await dataSource.fetchProfile(employeeId);
    return UserModel.fromJson(data);
  }

  @override
  Future<void> editProfile(int employeeId, UserEntity user) async {
    final data = (user as UserModel).toJson();
    await dataSource.editProfile(employeeId, data);
  }
}
