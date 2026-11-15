import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/repo/data_sourec/sign_up_data_source.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/repo/repo/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepo)
class SignUpRepoImp implements SignUpRepo {
  SignUpRepoImp(this._dataSource);
  SignUpDataSource _dataSource;
  @override
  Future<FireBaseResult<UserEntitty>> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _dataSource.signIn(email: email, password: password);
    return result;
  }
}
