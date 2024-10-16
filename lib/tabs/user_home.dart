import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.to(() => UserProfile(user: widget.user) );
        }, icon: const Icon(Icons.menu)),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage("assets/images/bg_no_color.png"),color: Colors.blue,
              size: 130,
            ),
            ImageIcon(
              AssetImage("assets/images/sunny.png"),
              color: Colors.amberAccent,
            ),
            SizedBox(width: 20,)
          ],
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height* .08,
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
                              const Text("Add")
                            ],
                          ),
                          const Positioned(
                              bottom: 12,
                              right: -5,
                              child: Card(
                                child: Icon(Icons.add),
                              )
                          )
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
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 5),
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
                      hintText: "Search People",
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child:
                        Icon(Icons.search, color: Colors.black),
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
                      PostCard(user: user1, postImage: "", postText: "I woke up feeling Good, Good is great and he has done it again. I trust and believe in him"),
                      PostCard(user: user2, postImage: "assets/images/pic1.png", postText: "I woke up feeling Good, Good is great and he has done it again. I trust and believe in him"),
                      PostCard(user: user2, postImage: "assets/images/pic1.png", postText: "I woke up feeling Good, Good is great and he has done it again. I trust and believe in him"),
                    ],
                  ),
                ),
              )
            ],
          ),
          MyBottomAppBar(width: width, index: 2, user: widget.user,)
        ],
      ),
    );
  }
}
