import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outdoor_social/model/user.dart';

import '../tabs/details.dart';

class HomeCard extends StatelessWidget {
  final String image;
  final String title;
  final String unread;
  final LocalUser user;
  const HomeCard({super.key, required this.title, required this.image, required this.unread, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 150,
        child: Stack(
          children: [
            Image.asset(image),
             Positioned(
                left: 0,
                bottom: 0,
                child: Padding(padding: const EdgeInsets.all(10),
                  child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 22),),)),
            Positioned(
                right: 0,
                top: 0,
                child: Padding(padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("+$unread", style: const TextStyle(color: Colors.white),),
                    ),
                  ),))
          ],
        ),
      ),
      onTap: () {
        Get.to(() => Details(title: title, user: user,),
            transition: Transition.cupertino,
            duration: const Duration(seconds: 1));
      },
    );
  }
}
