import 'package:flutter/material.dart';
import 'package:outdoor_social/model/user.dart';

class PostWidget extends StatelessWidget {
  final LocalUser user;
  const PostWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(user.imageUrl ?? "", height: 35,),
                  const SizedBox(width: 10,),
                  Text(user.fullName, style: const TextStyle(fontWeight: FontWeight.bold),),
                  user.verified ? Image.asset("assets/images/verified.png", height: 15, fit: BoxFit.fitHeight,) : const SizedBox()
                ],
              ),
              const Text("Today 5:30")
            ],),
          //
          const Text("Same tins ro do some lorem ipsum stuff wic are lorious, Same tins ro do some lorem ipsum stuff wic are lorious, Same tins ro do some lorem ipsum stuff wic are lorious"),
          //
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  IconButton(onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage("assets/images/chat.png"),
                      )),
                  const Positioned(
                    bottom: 1,
                      right: 5,
                      child: Text("45k")
                  )
                ],
              ),
              const SizedBox(width: 10,),
              Stack(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon:  const Icon(Icons.favorite_border_outlined)
                  ),
                  const Positioned(
                      bottom: 5,
                      right: 5,
                      child: Text("12")
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
