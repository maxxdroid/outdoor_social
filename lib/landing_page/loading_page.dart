import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/authentication/auth.dart';
import 'package:outdoor_social/local_storage/SharedPreferences.dart';
import 'package:outdoor_social/model/user.dart';
import 'package:outdoor_social/tabs/home.dart';

import '../authentication/login.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool status = false;
  LocalUser? user;

  @override
  void initState() {
    super.initState();
    check();
  }

  // Function to check the current user status and display the splash screen
  Future<void> check() async {
    // Check if a user is currently authenticated
    status = AuthMethods().auth.currentUser == null;

    // If a user is authenticated, load the user information from local storage
    if (!status) {
      user = await SaveLocally().getUser();
    }

    // Display the splash screen after checking the status
    displaySplash();
  }

  // Function to display the splash screen and navigate to the appropriate page
  void displaySplash() {
    Timer(const Duration(seconds: 2), () {
      if (status) {
        // Navigate to the SignUp page if no user is authenticated
        Get.offAll(() => const Login(),
            transition: Transition.cupertino,
            duration: const Duration(seconds: 1));
      } else if (user != null) {
        // Navigate to the Home page if a user is authenticated
        Get.offAll(() => Pages(user: user!),
            transition: Transition.cupertino,
            duration: const Duration(seconds: 1));
      } else {
        // Handle the case where user is null (optional: add an error page or fallback)
        Get.offAll(() => const Login(),
            transition: Transition.cupertino,
            duration: const Duration(seconds: 1));
        Get.snackbar('Error', 'Failed to load user information.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage("assets/images/bg_no_color.png"),
              color: Colors.blue,
              size: 200,
            ),
            CircularProgressIndicator(color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
