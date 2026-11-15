part of 'hiding_password_cubit.dart';

@immutable
sealed class HidingPasswordState {}

final class HidingPasswordInitial extends HidingPasswordState {}

final class ShowPassword extends HidingPasswordState {
  ShowPassword(this.showPassword);
  final bool showPassword;
}

final class HidePassword extends HidingPasswordState {
  HidePassword(this.hidePassword);
  final bool hidePassword;
}
