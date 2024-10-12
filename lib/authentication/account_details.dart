import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/authentication/follower.dart';

class AccountDetails extends StatefulWidget {
  final Map<String, dynamic> userDetails;
  const AccountDetails({super.key, required this.userDetails});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _biographyController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.white,
        title: const Text("Outdoor Social"),
        centerTitle: true,),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          const Icon(Icons.add_a_photo, size: 120,),
          const SizedBox(height: 20,),
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
                  hintText: "Username",
                  helperStyle: TextStyle(fontSize: 8),
                  // labelStyle: TextStyle(fontSize: 13),
                  border: InputBorder.none,

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
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
                  hintText: "Status",
                  helperStyle: TextStyle(fontSize: 8),
                  // labelStyle: TextStyle(fontSize: 13),
                  border: InputBorder.none,

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
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
                  hintText: "Biography",
                  helperStyle: TextStyle(fontSize: 8),
                  // labelStyle: TextStyle(fontSize: 13),
                  border: InputBorder.none,

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () {
                widget.userDetails["username"] = _userNameController.text.toString();
                widget.userDetails["status"] = _statusController.text.toString();
                widget.userDetails["biography_"] = _biographyController.text.toString()
                ;
                Get.to(const FollowPage(), transition: Transition.cupertino, duration: const Duration(seconds: 1));
              },
              style:
              ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: SizedBox(
                width: width * .5,
                height: 50,
                child: const Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
