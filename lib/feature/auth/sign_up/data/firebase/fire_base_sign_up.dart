import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/data/model/user_dto.dart';
import 'package:injectable/injectable.dart';

//!this to create a user account with email and password
@lazySingleton
class FireBaseSignUp {
  Future<FireBaseResult<UserDto>> signIn({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final db = FirebaseFirestore.instance;
      final addUser = await db
          .collection("users")
          .withConverter<UserDto>(
            fromFirestore: (snapshot, _) => UserDto.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );
      final uid = credential.user!.uid;
      UserDto user;
      final docRef = await addUser.doc(uid);
      final snapshot = await docRef.get();
      if (snapshot.exists && snapshot.data() != null) {
        user = await snapshot.data()!;
      } else {
        user = UserDto(id: uid, name: name, email: email);
        await docRef.set(user);
      }

      return FireBaseSuccess<UserDto>(user);
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
