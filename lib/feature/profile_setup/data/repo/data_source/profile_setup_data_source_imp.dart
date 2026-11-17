import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/profile_setup/domain/entity/user_profile_setup_data_entitty.dart';
import 'package:fit_volt/feature/profile_setup/domain/repo/data_source/profile_setup_data_source.dart';

class ProfileSetupDataSourceImp implements ProfileSetupDataSource {
  @override
  Future<FireBaseResult<UserProfileSetupDataEntitty>> getCompleteProfileSetup({
    required String gender,
    required String topGoal,
    required String tranningLevel,
    required double weight,
    required double height,
    required DateTime dateOfBirth,
  }) {
    // TODO: implement getCompleteProfileSetup
    throw UnimplementedError();
  }
}
