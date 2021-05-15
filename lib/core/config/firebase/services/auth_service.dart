
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xafe/app/splash_screen/presentation/screens/splash_screen.dart';
import 'package:xafe/core/config/firebase/utils/firebase_utils.dart';
import 'package:xafe/core/error/helpers/helpers.dart';
import 'package:xafe/src/utils/navigation/navigation.dart';

class XafeAuthService with XafeFirestoreUtils {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _user;

  User setUser(User user) => _user = user;

  User get getUser => _user;

  Stream<User> get onAuthStateChanged => _auth.authStateChanges();

  Future<User> getCurrentUser() async {
    final User user = _auth.currentUser;
    setUser(user);
    return user;
  }

  Future<User> loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    return await firebaseInterceptor(() => _auth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => value.user));
  }

  Future<User> signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    return await firebaseInterceptor(() => _auth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((result) => result.user));
  }

  Future<void> updatePassword(String password) async {
    return await firebaseInterceptor(
      () => _auth.currentUser.updatePassword(password).then((result) => result),
    );
  }

  Future<void> resetPassword({String email}) async {
    return await firebaseInterceptor(() =>
        _auth.sendPasswordResetEmail(email: email).then((value) => value));
  }

  Future signOut(BuildContext ctx) async {
    await _auth.signOut();
    _user = null;
    pushAndRemoveUntil(ctx, SplashScreen());
  }
}
