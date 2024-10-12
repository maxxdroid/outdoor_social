import 'package:flutter/material.dart';
import 'package:outdoor_social/widget/post_widget.dart';

import '../data/const_data.dart';

class Details extends StatefulWidget {
  final String title;
  const Details({super.key, required this.title});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const  Icon(Icons.menu),
        title: Row(
          children: [
            Text( widget.title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const ImageIcon(
              AssetImage("assets/images/sunny.png"),
              color: Colors.amberAccent,
            )
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 5),
            // height: 50,
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
                  // helperStyle: TextStyle(fontSize: 8),
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
            height: height * .8,
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  PostWidget(user: user1,),
                  const Divider(),
                  PostWidget(user: user2,),
                  const Divider(),
                  PostWidget(user: user1,),
                  const Divider(),
                  PostWidget(user: user3,),
                  const Divider(),
                  PostWidget(user: user2),
                  const Divider(),
                  PostWidget(user: user3),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
