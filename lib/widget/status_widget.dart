import 'package:flutter/material.dart';

import '../model/user.dart';

class StatusWidget extends StatelessWidget {
  final LocalUser user;
  const StatusWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            child: Image.asset(user.imageUrl ?? ""),
          ),
          Row(
            children: [
              Text(user.fullName),
              user.verified ? Image.asset("assets/images/verified.png", height: 15, fit: BoxFit.fitHeight,) : const SizedBox()
            ],
          )
        ],
      ),
    );
  }
}
