import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_volt/core/network/fire_base_result.dart';
import 'package:fit_volt/feature/auth/sign_up/data/model/user_dto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseSignUpWithGoogle {
  Future<FireBaseResult<UserDto>> signUpWithGoogle() async {
    final GoogleSignIn _googleSignUpInstance = GoogleSignIn.instance;
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    try {
      await _googleSignUpInstance.initialize();
      final GoogleSignInAccount googleUser = await _googleSignUpInstance
          .authenticate();

      final String? idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        return FireBaseError<UserDto>(
          "Id token from google not found , please try again or sign up with anoter account",
        );
      } else {
        final OAuthCredential credintial = await GoogleAuthProvider.credential(
          idToken: idToken,
        );
        final firebaseCredintila = await FirebaseAuth.instance
            .signInWithCredential(credintial);
        final addUser = _fireStore
            .collection("users")
            .withConverter<UserDto>(
              fromFirestore: (snapshot, _) =>
                  UserDto.fromJson(snapshot.data()!),
              toFirestore: (json, _) => json.toJson(),
            );
        final String uid = firebaseCredintila.user!.uid;

        final docRef = await addUser.doc(uid);
        final snapshot = await docRef.get();
        UserDto user;
        if (snapshot.data() != null && snapshot.exists) {
          user = snapshot.data()!;
        } else {
          user = UserDto(
            id: uid,
            email: firebaseCredintila.user!.email,
            name: firebaseCredintila.user!.displayName,
          );
          await docRef.set(user);
        }
        return FireBaseSuccess<UserDto>(user);
      }
    } on SocketException {
      return FireBaseError<UserDto>("No internet please try again latter");
    } catch (e) {
      return FireBaseError<UserDto>("Uknown error please try again latter");
    }
  }
}
