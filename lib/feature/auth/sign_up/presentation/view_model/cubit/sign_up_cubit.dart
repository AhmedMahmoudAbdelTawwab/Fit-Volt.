import 'package:bloc/bloc.dart';
import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:meta/meta.dart';

part 'sign_up_cubit_state.dart';

class SignUpCubit extends Cubit<SignUpCubitState> {
  SignUpUseCase _case;
  SignUpCubit(this._case) : super(SignUpCubitInitial());
  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    emit(SignUpCubitLodaing());
    final result = await _case.call(email: email, password: password);
    switch (result) {
      case FireBaseSuccess<UserEntitty>():
        emit(SignUpCubitSuccess(userEntitty: result.data));
      case FireBaseError<UserEntitty>():
        emit(SignUpCubitError(messageError: result.message));
    }
  }
}
