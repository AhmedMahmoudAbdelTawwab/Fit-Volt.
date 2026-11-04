import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_in/data/model/user_dto.dart';
import 'package:injectable/injectable.dart';

//!this to create a user account with email and password
@lazySingleton
class FireBaseSignIn {
  Future<FireBaseResult<UserDto>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return FireBaseSuccess<UserDto>(
        UserDto(email: credential.user!.email, id: credential.user!.uid),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return FireBaseError<UserDto>('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return FireBaseError<UserDto>(
          'The account already exists for that email.',
        );
      }
    } catch (e) {
      return FireBaseError<UserDto>(e.toString());
    }
    return FireBaseError<UserDto>("Bad connection please try again later");
  }
}
