import 'package:bloc/bloc.dart';
import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/entitty/user_entitty.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:fit_volt/feature/auth/sign_up/domain/use_case/sign_up_with_google_use_case.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_cubit_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpCubitState> {
  SignUpUseCase _case;
  SignUpWithGoogleUseCase _signUpWithGoogleUseCase;
  SignUpCubit(this._case, this._signUpWithGoogleUseCase)
    : super(SignUpCubitInitial());
  Future<void> signUpwithGoogle() async {
    emit(SignUpCubitLodaing());
    final result = await _signUpWithGoogleUseCase.call();
    switch (result) {
      case FireBaseSuccess<UserEntitty>():
        emit(SignUpCubitSuccess(userEntitty: result.data));
      case FireBaseError<UserEntitty>():
        if (result.message == "Canceled") {
          emit(SignUpCubitInitial());
          return;
        }
        emit(SignUpCubitError(messageError: result.message));
    }
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpCubitLodaing());
    final result = await _case.call(
      email: email,
      password: password,
      name: name,
    );
    switch (result) {
      case FireBaseSuccess<UserEntitty>():
        emit(SignUpCubitSuccess(userEntitty: result.data));
      case FireBaseError<UserEntitty>():
        emit(SignUpCubitError(messageError: result.message));
    }
  }
}
