import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/tabs/user_profile.dart';
import 'package:outdoor_social/widget/bottom_app_bar.dart';
import 'package:outdoor_social/widget/home_card.dart';

import '../model/user.dart';

class Pages extends StatefulWidget {
  final LocalUser user;
  const Pages({super.key, required this.user});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
            children: [
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
                height: height * .81,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      HomeCard(title: "Motivations", image: "assets/images/motivations.png", unread: "345", user: widget.user,),
                      const SizedBox(height: 10,),
                      HomeCard(title: "Education", image: "assets/images/education.png", unread: "25", user: widget.user),
                      const SizedBox(height: 10,),
                      HomeCard(title: "Comedy", image: "assets/images/comedy.png", unread: "768", user: widget.user),
                      const SizedBox(height: 10,),
                      HomeCard(title: "Trends", image: "assets/images/trends.png", unread: "900", user: widget.user),
                      const SizedBox(height: 10,),
                      HomeCard(title: "Sports", image: "assets/images/sports.png", unread: "123k", user: widget.user),
                      const SizedBox(height: 50,)
                    ],
                  ),
                ),
              ),
            ],
          ),
          MyBottomAppBar(width: width, index: 0, user: widget.user,)
        ],
      ),
    );
  }
}
