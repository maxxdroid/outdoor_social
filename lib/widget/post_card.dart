import 'package:flutter/material.dart';

import '../model/user.dart';

class PostCard extends StatelessWidget {
  final String postText;
  final String postImage;
  final LocalUser user;
  const PostCard({super.key, required this.user, required this.postImage, required this.postText});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Text(postText),
          //
          postImage == "" ? const SizedBox() :
          Image.asset(postImage , width: width, fit: BoxFit.fill,),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: width,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ImageIcon(
                      AssetImage("assets/images/chat.png"),
                    ),
                    Text("15"),
                  ],
                ),
                SizedBox(width: 10,),
                Row(
                  children: [
                    Icon(Icons.favorite_border_outlined),
                    Text("15")
                  ],
                ),
                SizedBox(width: 10,),
                Row(
                  children: [
                    Icon(Icons.redo),
                    Text("15")
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.comment_bank_outlined),
                    Text("15")
                  ],
                ),
                SizedBox(width: 10,),
                Icon(Icons.bookmark_border),
                SizedBox(width: 10,),
                Icon(Icons.share),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
