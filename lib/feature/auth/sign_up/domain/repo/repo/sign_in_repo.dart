import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';

abstract interface class SignInRepo {
  Future<FireBaseResult<UserEntitty>> signIn({
    required String email,
    required String password,
  });
}
