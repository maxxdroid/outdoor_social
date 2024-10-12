import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/authentication/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Outdoor Social", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10),
            // height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,vertical: 0 ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Enter your Email",
                  helperStyle: TextStyle(fontSize: 8),
                  // labelStyle: TextStyle(fontSize: 13),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Invalid email format';
                  } else if (!value.contains('@')) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 10),
            // height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,vertical: 0 ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Password",
                  helperStyle: TextStyle(fontSize: 8),
                  border: InputBorder.none,

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Invalid email format';
                  } else if (!value.contains('@')) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.only(right: 30, bottom: 30),
              child: Text("Forgot password?"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
              },
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: SizedBox(
                width: width * .5,
                height: 50,
                child: const Center(
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width * .4, child: const Divider()),
              const Text(" Or "),
              SizedBox(width: width * .4, child: const Divider())
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const SignUp(),
                          transition: Transition.cupertino,
                          duration: const Duration(seconds: 1));
                    },
                    child: const Text(
                      "Register Now",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
