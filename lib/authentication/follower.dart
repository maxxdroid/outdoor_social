import 'package:flutter/material.dart';
import 'package:outdoor_social/data/const_data.dart';
import 'package:outdoor_social/widget/user_card.dart';
import 'package:get/get.dart';

import '../tabs/home.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.white,
        title: const Text("Outdoor Social", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
        centerTitle: true,),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  UserCard(user: user1, width: width,),
                  const SizedBox(height: 10,),
                  UserCard(user: user2, width: width,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                  onPressed: () {
                    // Get.to(const Pages(),
                    //     transition: Transition.cupertino,
                    //     duration: const Duration(seconds: 1));
                  },
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  )),
            )
          )
        ],
      )
    );
  }
}
