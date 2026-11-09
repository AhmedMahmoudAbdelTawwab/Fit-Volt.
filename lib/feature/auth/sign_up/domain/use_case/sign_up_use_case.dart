import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/repo/repo/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  SignUpUseCase(this._signInRepo);
  SignInRepo _signInRepo;
  Future<FireBaseResult<UserEntitty>> call({
    required String email,
    required String password,
  }) async => _signInRepo.signIn(email: email, password: password);
}
