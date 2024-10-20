import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/database/database.dart';
import 'package:outdoor_social/local_storage/SharedPreferences.dart';
import 'package:outdoor_social/tabs/home.dart';

import '../model/user.dart';
import 'login.dart';

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
            fullName: userDetails["fullName"],
            role: "user",
            userID: firebaseUser.uid,
            phoneNumber: userDetails["phoneNumber"],
            imageUrl: userDetails["imageUrl"],
            status: userDetails["status"],
            dob: userDetails["dob"],
            username: userDetails["username"],
            biography: userDetails["biography"],
            verified: false);


        await Database().saveUserInfoTo(user.toJson());
        await SaveLocally().saveUser(user);
        Get.to(()=> Pages(user: user),
            transition: Transition.cupertino, duration: const Duration(seconds: 1));
      }
    } catch (error) {
      // errorHandling(error);
      print(error);
      Get.snackbar('Error', 'Try again later an error occurred');
    }
  }

  Future<String> signIn (Map<String, dynamic> userDetails) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: "${userDetails["username"]}@gmail.com",
        password: userDetails["password"],
      );
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {

        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .get();

        if(userDoc.exists) {
          Map<String, dynamic> userInfoMap = userDoc.data() as Map<String, dynamic>;
          LocalUser loggedUser = LocalUser.fromJson(userInfoMap);
          await SaveLocally().saveUser(loggedUser);
          Get.to(()=> Pages(user: loggedUser,),
              transition: Transition.cupertino, duration: const Duration(seconds: 1));
          return "success";
        }
      }
      return "failed";
    } catch (error) {
      // errorHandling(error);
      return "failed";
    }

  }

  logOut() {
    auth.signOut();
    Get.offAll(() => const Login());
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

