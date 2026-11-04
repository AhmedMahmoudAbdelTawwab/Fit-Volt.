import 'package:fit_volt/feature/auth/sign_in/domain/repo/repo/sign_in_repo.dart';

class SignInUseCase {
  SignInUseCase(this._signInRepo);
  SignInRepo _signInRepo;
  Future<void> call({required String email, required String password}) async =>
      _signInRepo.signIn(email: email, password: password);
}
