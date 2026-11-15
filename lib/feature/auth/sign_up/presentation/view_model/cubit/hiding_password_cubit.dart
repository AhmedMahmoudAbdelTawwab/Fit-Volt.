import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hiding_password_state.dart';

class HidingPasswordCubit extends Cubit<bool> {
  HidingPasswordCubit() : super(true);
  void changePassword() {
    emit(!state);
  }
}
