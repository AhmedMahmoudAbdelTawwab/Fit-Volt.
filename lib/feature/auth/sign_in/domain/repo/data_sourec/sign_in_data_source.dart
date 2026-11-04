import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_in/domain/entitty/user_entitty.dart';

abstract interface class SignInDataSource {
  Future<FireBaseResult<UserEntitty>> signIn({
    required String email,
    required String password,
  });
}
