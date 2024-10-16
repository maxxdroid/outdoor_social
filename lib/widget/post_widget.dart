import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:outdoor_social/model/user.dart';

import '../model/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    String formattedDate = _formatDate(post.date);

    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
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
              Text(formattedDate)
            ],),
          //
          Text(post.content),
          //
          // const SizedBox(
          //   height: 5,
          // ),
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

  // Helper function to format the date
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (date.isAfter(today)) {
      // If the date is today, return "Today 5:30"
      return "Today ${DateFormat('h:mm a').format(date)}";
    } else if (date.isAfter(yesterday)) {
      // If the date is yesterday, return "Yesterday"
      return "Yesterday";
    } else {
      // For other dates, return "MMM d, yyyy"
      return DateFormat('MMM d, yyyy').format(date);
    }
  }
}
