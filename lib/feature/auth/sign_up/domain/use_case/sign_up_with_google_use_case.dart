import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/repo/repo/sign_up_with_google_repo.dart';

class SignUpWithGoogleUseCase {
  SignUpWithGoogleRepo _googleRepo;

  SignUpWithGoogleUseCase({required this._googleRepo});
  Future<FireBaseResult<UserEntitty>> call() => _googleRepo.signUpWithGoogle();
}
