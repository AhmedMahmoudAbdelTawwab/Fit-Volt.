part of 'sign_up_cubit.dart';

sealed class SignUpCubitState {}

final class SignUpCubitInitial extends SignUpCubitState {}

final class SignUpCubitLodaing extends SignUpCubitState {}

final class SignUpCubitSuccess extends SignUpCubitState {
  SignUpCubitSuccess({required this.userEntitty});
  final UserEntitty userEntitty;
}

final class SignUpCubitError extends SignUpCubitState {
  SignUpCubitError({required this.messageError});
  final String messageError;
}
