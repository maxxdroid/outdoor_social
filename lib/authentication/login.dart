import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/authentication/auth.dart';
import 'package:outdoor_social/authentication/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const ImageIcon(
          AssetImage("assets/images/bg_no_color.png"),color: Colors.blue,
          size: 140,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text("LogIn", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  // const SizedBox(height: 10,),
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
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Enter your username",
                          helperStyle: TextStyle(fontSize: 8),
                          // labelStyle: TextStyle(fontSize: 13),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter username';
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
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          helperStyle: TextStyle(fontSize: 8),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
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
                      onPressed: () async {

                        Map<String, dynamic> userDetails = {
                          "username" : _usernameController.text.toString(),
                          "password"  : _passwordController.text.toString()
                        };

                        final FormState? form = _formKey.currentState;

                        if(form!.validate()) {

                          setState(() {
                            _isLoading = true;
                          });

                          var result = await AuthMethods().signIn(userDetails);

                          if(result == "failed") {
                            Get.snackbar("Sign In Error", "Try again later");
                            setState(() {
                              _isLoading = false;
                            });
                          }

                        }

                      },
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.blue),
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
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Card(
                          child: Center(child: CircularProgressIndicator())))),
            )
        ],
      )
    );
  }
}
