import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_in/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_in/domain/repo/data_sourec/sign_in_data_source.dart';
import 'package:fit_volt/feature/auth/sign_in/domain/repo/repo/sign_in_repo.dart';

class SignInRepoImp implements SignInRepo {
  SignInRepoImp(this._dataSource);
  SignInDataSource _dataSource;
  @override
  Future<FireBaseResult<UserEntitty>> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _dataSource.signIn(email: email, password: password);
    return result;
  }
}
