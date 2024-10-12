import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:outdoor_social/database/database.dart';
import 'package:outdoor_social/tabs/home.dart';

import '../model/user.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;

  signUp (Map<String, dynamic> userDetails) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: userDetails["email"],
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
      // await Sharedprefhelper().saveUser(user);
      // Get.to(PageTabs(user: user,),
      //     transition: Transition.cupertino,
      //     duration: const Duration(seconds: 1));
      Get.to(()=> const Pages(),
        transition: Transition.cupertino, duration: const Duration(seconds: 1));
    }
  }

  signIn (Map<String, dynamic> userDetails) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: userDetails["email"],
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
    }
  }

}