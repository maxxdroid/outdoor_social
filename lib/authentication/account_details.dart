import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'auth.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();

  bool imageSelected = false;

  late File _pic;
  Future _selectFromGallery() async{
    var tempImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pic = File(tempImage!.path);
      imageSelected = true;
    });
  }

  Future _takeFromCamera() async{
    var tempImage = await _imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pic = File(tempImage!.path);
      imageSelected = true;
    });
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.white,
        title: const ImageIcon(
          AssetImage("assets/images/bg_no_color.png"),color: Colors.blue,
          size: 140,
        ),
        centerTitle: true,),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: _selectFromGallery,
                      child: imageSelected == true ? CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(_pic)
                      ) : CircleAvatar(
                        radius: 60,
                        child: Image.asset("assets/images/profile-img.jpeg"),
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
                          controller: _userNameController,
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
                          controller: _statusController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Status",
                            helperStyle: TextStyle(fontSize: 8),
                            // labelStyle: TextStyle(fontSize: 13),
                            border: InputBorder.none,
                          ),
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
                          controller: _biographyController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Biography",
                            helperStyle: TextStyle(fontSize: 8),
                            // labelStyle: TextStyle(fontSize: 13),
                            border: InputBorder.none,

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a biography';
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
                          widget.userDetails["biography"] = _biographyController.text.toString();

                          final FormState? form = _formKey.currentState;

                          if (!imageSelected) {
                            Get.snackbar('Error', 'Add Profile Image');
                          } else if(form!.validate() & _pic.path.isNotEmpty) {
                            AuthMethods().signUp(widget.userDetails,  _pic);
                            setState(() {
                              _isLoading = true;
                            });
                          }


                        },
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
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
                )
            ),
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
            ),
        ],
      ),
    );
  }
}
