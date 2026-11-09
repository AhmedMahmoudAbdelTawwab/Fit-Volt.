part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpCubitState {}

final class SignUpCubitInitial extends SignUpCubitState {}

final class SignUpCubitLodaing extends SignUpCubitState {}

// ignore: must_be_immutable
final class SignUpCubitSuccess extends SignUpCubitState {
  SignUpCubitSuccess({required this.userEntitty});
  UserEntitty userEntitty;
}

// ignore: must_be_immutable
final class SignUpCubitError extends SignUpCubitState {
  SignUpCubitError({required this.messageError});
  String messageError;
}
