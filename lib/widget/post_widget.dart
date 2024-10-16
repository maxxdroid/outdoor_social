import 'package:flutter/material.dart';
import 'package:outdoor_social/model/user.dart';

import '../model/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent, // Optional: Set background color if needed
                    child: ClipOval(
                      child: Image.network(
                        post.user.imageUrl,
                        fit: BoxFit.cover,
                        width: 35, // Width should be twice the radius
                        height: 35, // Height should be twice the radius
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(post.user.fullName, style: const TextStyle(fontWeight: FontWeight.bold),),
                  post.user.verified ? Image.asset("assets/images/verified.png", height: 15, fit: BoxFit.fitHeight,) : const SizedBox()
                ],
              ),
              const Text("Date")
            ],),
          //
          Text(post.content),
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
          ),
          const Divider(),
        ],
      ),
    );
  }
}
