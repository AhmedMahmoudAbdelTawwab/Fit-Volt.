part of 'sign_in_cubit_cubit.dart';

@immutable
sealed class SignInCubitState {}

final class SignInCubitInitial extends SignInCubitState {}

final class SignInCubitSuccess extends SignInCubitState {}

final class SignInCubitError extends SignInCubitState {}
