import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/repo/data_sourec/sign_up_with_google_data_source.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/repo/repo/sign_up_with_google_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpWithGoogleRepo)
class SignUpWithGoogleRepoImp implements SignUpWithGoogleRepo {
  SignUpWithGoogleDataSource _signUpWithGoogleDataSource;

  SignUpWithGoogleRepoImp({required this._signUpWithGoogleDataSource});
  @override
  Future<FireBaseResult<UserEntitty>> signUpWithGoogle() async {
    final result = await _signUpWithGoogleDataSource.signUpWithGoogle();
    return result;
  }
}
