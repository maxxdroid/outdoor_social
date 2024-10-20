import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outdoor_social/data/const_data.dart';
import 'package:outdoor_social/model/user.dart';
import 'package:outdoor_social/tabs/user_profile.dart';
import 'package:outdoor_social/widget/bottom_app_bar.dart';
import 'package:outdoor_social/widget/post_card.dart';
import 'package:outdoor_social/widget/status_widget.dart';

class UserHome extends StatefulWidget {
  final LocalUser user;
  const UserHome({super.key, required this.user});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final ImagePicker _imagePicker = ImagePicker();
  List<File> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => UserProfile(user: widget.user));
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage("assets/images/bg_no_color.png"),
              color: Colors.blue,
              size: 130,
            ),
            ImageIcon(
              AssetImage("assets/images/sunny.png"),
              color: Colors.amberAccent,
            ),
            SizedBox(width: 20),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: Container(
        height: 100,
        width: 50,
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () {
            _showCreatePostModal(context);
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, color: Colors.blue),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .08,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Image.network(widget.user.imageUrl),
                              ),
                              const Text("Add"),
                            ],
                          ),
                          const Positioned(
                            bottom: 12,
                            right: -5,
                            child: Card(
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StatusWidget(user: user1),
                    StatusWidget(user: user2),
                    StatusWidget(user: user3),
                    StatusWidget(user: user1),
                    StatusWidget(user: user2),
                    StatusWidget(user: user1),
                    StatusWidget(user: user2),
                  ],
                ),
              ),
              Container(
                height: 40,
                margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Search People",
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .73,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PostCard(
                        user: user1,
                        postImage: "",
                        postText:
                        "I woke up feeling Good, Good is great and he has done it again. I trust and believe in him",
                      ),
                      PostCard(
                        user: user2,
                        postImage: "assets/images/pic1.png",
                        postText:
                        "I woke up feeling Good, Good is great and he has done it again. I trust and believe in him",
                      ),
                      PostCard(
                        user: user2,
                        postImage: "assets/images/pic1.png",
                        postText:
                        "I woke up feeling Good, Good is great and he has done it again. I trust and believe in him",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          MyBottomAppBar(width: width, index: 2, user: widget.user),
        ],
      ),
    );
  }

  void _showCreatePostModal(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            Future<void> selectMultipleImages() async {
              final List<XFile>? tempImages =
              await _imagePicker.pickMultiImage();
              if (tempImages != null && tempImages.isNotEmpty) {
                setModalState(() {
                  selectedImages = tempImages.map((e) => File(e.path)).toList();
                });
              }
            }

            return Container(
              height: 600,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: "Write Something",
                        border: InputBorder.none,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          if (selectedImages.isNotEmpty)
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: selectedImages.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.file(
                                      selectedImages[index],
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: 200,
                                    ),
                                  );
                                },
                              ),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: selectMultipleImages,
                                    icon: const Icon(Icons.camera, size: 30),
                                  ),
                                  IconButton(
                                    onPressed: selectMultipleImages,
                                    icon: const Icon(Icons.image, size: 30),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle the post action here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                child: const Text(
                                  "Post",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
