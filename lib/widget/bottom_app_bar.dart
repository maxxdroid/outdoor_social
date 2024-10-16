import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:outdoor_social/tabs/user_home.dart';

import '../model/user.dart';
import '../tabs/home.dart';

class MyBottomAppBar extends StatelessWidget {
  final int index;
  final double width;
  final LocalUser user;
  const MyBottomAppBar({super.key, required this.width, required this.index, required this.user});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(padding: const EdgeInsets.all(10),
          child: Card(
            color: Colors.white.withOpacity(.5),
            shadowColor: Colors.black,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Padding(padding: const EdgeInsets.all(0),
                child: SizedBox(
                  width: width * .78,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed:  () {
                            Get.to(()=> const Pages(),
                                transition: Transition.fadeIn, duration: const Duration(milliseconds: 100));
                          },
                          icon: ImageIcon(
                            const AssetImage("assets/images/comp.png"),
                            color: index == 0 ? Colors.blue : Colors.black,
                          )
                      ),
                      const SizedBox(width: 20,),
                      IconButton(
                          onPressed:  () {},
                          icon: const Icon(Icons.pie_chart_outline_outlined),
                        color: index == 1 ? Colors.blue : Colors.black,
                      ),
                      const SizedBox(width: 20,),
                      IconButton(
                          onPressed:  () {
                            Get.to(()=> UserHome(user: user,),
                                transition: Transition.fadeIn, duration: const Duration(milliseconds: 100));
                          },
                          icon:  ImageIcon(
                            const AssetImage("assets/images/home.png"),
                            color: index == 2 ? Colors.blue : Colors.black,
                          )
                      ),
                      const SizedBox(width: 20,),
                      IconButton(
                          onPressed:  () {},
                          icon: const Icon(Icons.wb_sunny_outlined),
                        color: index == 3 ? Colors.blue : Colors.black,
                      )
                    ],
                  ),
                )
            ),
          )),
    );
  }
}
