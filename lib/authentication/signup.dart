import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/authentication/account_details.dart';
import 'package:outdoor_social/authentication/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Outdoor Social"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
            child: SingleChildScrollView(
              child: Column(
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
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          hintText: "Phone number",
                          helperStyle: TextStyle(fontSize: 8),
                          // labelStyle: TextStyle(fontSize: 13),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a Number';
                          } else if (value.length < 10) {
                            return 'Enter a valid number';
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
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: "Full Name",
                          helperStyle: TextStyle(fontSize: 8),
                          // labelStyle: TextStyle(fontSize: 13),
                          border: InputBorder.none,

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be empty';
                          } else if (value.length < 10) {
                            return 'Invalid a valid name';
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
                          hintText: "Date of Birth (dd/mm/yy)",
                          helperStyle: TextStyle(fontSize: 8),
                          // labelStyle: TextStyle(fontSize: 13),
                          border: InputBorder.none,
                        ),
                        controller: _dateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a date of birth';
                          } else if (value.length < 5) {
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
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          helperStyle: TextStyle(fontSize: 8),
                          // labelStyle: TextStyle(fontSize: 13),
                          border: InputBorder.none,

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Cannot be empty';
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
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                          hintText: "Confirm Password",
                          helperStyle: TextStyle(fontSize: 8),
                          // labelStyle: TextStyle(fontSize: 13),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {

                        Map<String, dynamic> userDetails = {
                          "name" : _nameController.text.toString(),
                          "number" : _phoneController.text.toString(),
                          "dob" : _dateController.text.toString(),
                          "password"  : _passwordController.text.toString()
                        };


                        final FormState? form = _formKey.currentState;

                        if(form!.validate()) {
                          Get.to(AccountDetails(userDetails: userDetails,), transition: Transition.cupertino, duration: const Duration(seconds: 1));
                          // AuthMethods().signIn(userDetails);
                        }

                      },
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      child: SizedBox(
                        width: width * .5,
                        height: 50,
                        child: const Center(
                          child: Text(
                            "Continue",
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
                ],
              ),
            )
        )
    );
  }
}
