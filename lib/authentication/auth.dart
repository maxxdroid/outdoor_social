import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/database/database.dart';
import 'package:outdoor_social/local_storage/SharedPreferences.dart';
import 'package:outdoor_social/tabs/home.dart';

import '../model/user.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;

  signUp (Map<String, dynamic> userDetails, File pic) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: "${userDetails["username"]}@gmail.com",
        password: userDetails["password"],
      );
      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {

        userDetails["imageUrl"] = await Database().uploadImage(pic);


        LocalUser user = LocalUser(
            fullName: userDetails["username"],
            role: "user",
            userID: firebaseUser.uid,
            imageUrl: userDetails["imageUrl"],
            status: userDetails["status"],
            dob: userDetails["dob"],
            username: userDetails["username"],
            biography: userDetails["biography"],
            verified: false);

        print("........${user.toJson()}");

        await Database().saveUserInfoTo(user.toJson());
        await SaveLocally().saveUser(user);
        Get.to(()=> const Pages(),
            transition: Transition.cupertino, duration: const Duration(seconds: 1));
      }
    } catch (error) {
      // errorHandling(error);
    }
  }

  signIn (Map<String, dynamic> userDetails) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: "${userDetails["email"]}@gmail.com",
        password: userDetails["password"],
      );
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        // LocalUser user = LocalUser(
        //     name: userDetails["email"],
        //     role: userDetails["role"],
        //     userID: firebaseUser.uid,
        //     email: userDetails["email"],
        //     verified: false);
        // await SaveLocally().saveUser(user);

        Get.to(()=> const Pages(),
            transition: Transition.cupertino, duration: const Duration(seconds: 1));
      }
    } catch (error) {
      // errorHandling(error);
    }
  }

  void errorHandling(dynamic error) {
    String errorMessage;

    switch (error.code) {
      case "email-already-in-use":
        errorMessage = "Email already used. Go to login page.";
        Get.back();
        break;
      case "wrong-password":
        errorMessage = "Wrong email/password combination.";
        Get.back();
        break;
      case "user-not-found":
        errorMessage = "No user found with this email.";
        Get.back();
        break;
      case "user-disabled":
        errorMessage = "User disabled.";
        Get.back();
        break;
      case "too-many-requests":
        errorMessage = "Too many requests to log into this account.";
        Get.back();
        break;
      case "operation-not-allowed":
        errorMessage = "Server error, please try again later.";
        Get.back();
        break;
      case "invalid-email":
        errorMessage = "Email address is invalid.";
        Get.back();
        break;
      default:
        errorMessage = "Sign up error, please try again later.";
        Get.back();
    }

    print(errorMessage);
  }

}

