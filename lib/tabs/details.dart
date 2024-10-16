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
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
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
                      onTap: () {},
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
                  height: height * .74,
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
                ),
                SizedBox(
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: width * .8,
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0),
                        // height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,vertical: 3 ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              hintText: "Type Something ...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          // padding: EdgeInsets.zero,
                          icon: const Icon(Icons.send)
                      )
                    ],
                  ),
                )
              ],
            ),
            // Positioned(
            //     bottom: 0,
            //     child:SizedBox(
            //       width: width,
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         children: [
            //           Container(
            //             width: width * .8,
            //             height: 40,
            //             margin: const EdgeInsets.symmetric(
            //                 horizontal: 10.0, vertical: 10),
            //             // height: 50,
            //             decoration: BoxDecoration(
            //               color: Colors.grey.withOpacity(.5),
            //               borderRadius: BorderRadius.circular(50),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.symmetric(
            //                   horizontal: 20.0,vertical: 10 ),
            //               child: TextFormField(
            //                 keyboardType: TextInputType.emailAddress,
            //                 decoration: const InputDecoration(
            //                   hintText: "Type Something ...",
            //                   // helperStyle: TextStyle(fontSize: 8),
            //                   border: InputBorder.none,
            //                   // prefixIcon: Padding(
            //                   //   padding: EdgeInsets.only(right: 10),
            //                   //   child:
            //                   //   Icon(Icons.search, color: Colors.black),
            //                   // ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           IconButton(
            //               onPressed: () {},
            //               // padding: EdgeInsets.zero,
            //               icon: Icon(Icons.send)
            //           )
            //         ],
            //       ),
            //     )
            // )
          ],
        ),
      ),
    );
  }
}
