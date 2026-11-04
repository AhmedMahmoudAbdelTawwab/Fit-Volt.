import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_in/data/firebase/fire_base_sign_in.dart';
import 'package:fit_volt/feature/auth/sign_in/data/model/user_dto.dart';
import 'package:fit_volt/feature/auth/sign_in/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_in/domain/repo/data_sourec/sign_in_data_source.dart';

class SignInDataSourceImp implements SignInDataSource {
  SignInDataSourceImp(this._fireBaseSignIn);
  FireBaseSignIn _fireBaseSignIn;
  @override
  Future<FireBaseResult<UserEntitty>> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _fireBaseSignIn.signIn(
      email: email,
      password: password,
    );
    switch (result) {
      case FireBaseSuccess<UserDto>():
        final userEntitty = result.data.toEntitty();
        return FireBaseSuccess<UserEntitty>(userEntitty);
      case FireBaseError<UserDto>():
        String errorMessage = result.message;
        return FireBaseError<UserEntitty>(errorMessage);
    }
  }
}
