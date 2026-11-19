import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/data/firebase/fire_base_sign_up.dart';
import 'package:fit_volt/feature/auth/sign_up/data/model/user_dto.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/repo/data_sourec/sign_up_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImp implements SignUpDataSource {
  SignUpDataSourceImp(this._fireBaseSignUp);
  FireBaseSignUp _fireBaseSignUp;
  @override
  Future<FireBaseResult<UserEntitty>> signIn({
    required String email,
    required String password,
    required String name,
  }) async {
    final result = await _fireBaseSignUp.signIn(
      email: email,
      password: password,
      name: name,
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
