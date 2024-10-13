import 'package:flutter/material.dart';

import '../model/user.dart';

class UserCard extends StatelessWidget {
  final LocalUser user;
  final double width;
  const UserCard({super.key, required this.user, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Icon(Icons.person, size: 70,),
            Image.asset(user.imageUrl ?? ""),
            const SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * .4,
                  child: Text( user.fullName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  width: width * .45,
                  child: Text(user.biography ?? "Description"),
                )
              ],
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {
            },
            style:
            ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const SizedBox(
              // width: width * .5,
              // height: 20,
              child: Center(
                child: Text(
                  "follow",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ))
      ],
    );
  }
}
