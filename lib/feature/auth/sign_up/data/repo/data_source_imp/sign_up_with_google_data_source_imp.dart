import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/data/firebase/firebase_sign_up_with_google.dart';
import 'package:fit_volt/feature/auth/sign_up/data/model/user_dto.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/repo/data_sourec/sign_up_with_google_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpWithGoogleDataSource)
class SignUpWithGoogleDataSourceImp implements SignUpWithGoogleDataSource {
  FirebaseSignUpWithGoogle _firebaseSignUpWithGoogle;

  SignUpWithGoogleDataSourceImp({required this._firebaseSignUpWithGoogle});
  @override
  Future<FireBaseResult<UserEntitty>> signUpWithGoogle() async {
    final result = await _firebaseSignUpWithGoogle.signUpWithGoogle();
    switch (result) {
      case FireBaseSuccess<UserDto>():
        final data = result.data.toEntitty();
        return FireBaseSuccess<UserEntitty>(data);
      case FireBaseError<UserDto>():
        String message = result.message;
        return FireBaseError<UserEntitty>(message);
    }
  }
}
