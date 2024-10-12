import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/database/database.dart';
import 'package:outdoor_social/local_storage/SharedPreferences.dart';
import 'package:outdoor_social/tabs/home.dart';

import '../model/user.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;

  signUp (Map<String, dynamic> userDetails) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: "${userDetails["username"]}@gmail.com",
      password: userDetails["password"],
    );
    User? firebaseUser = userCredential.user;

    if (firebaseUser != null) {
      LocalUser user = LocalUser(
          name: userDetails["email"],
          role: userDetails["role"],
          userID: firebaseUser.uid,
          email: userDetails["email"],
          verified: false);

      await Database().saveUserInfoTo(user.toJson());
      await SaveLocally().saveUser(user);
      Get.to(()=> const Pages(),
        transition: Transition.cupertino, duration: const Duration(seconds: 1));
    }
  }

  signIn (Map<String, dynamic> userDetails) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: "${userDetails["email"]}@gmail.com",
      password: userDetails["password"],
    );
    User? firebaseUser = userCredential.user;

    if (firebaseUser != null) {
      LocalUser user = LocalUser(
          name: userDetails["email"],
          role: userDetails["role"],
          userID: firebaseUser.uid,
          email: userDetails["email"],
          verified: false);
      await SaveLocally().saveUser(user);
    }
  }

}