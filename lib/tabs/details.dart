import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outdoor_social/database/database.dart';
import 'package:outdoor_social/model/post.dart';
import 'package:outdoor_social/widget/post_widget.dart';

import '../data/const_data.dart';
import '../model/user.dart';

class Details extends StatefulWidget {
  final String title;
  final LocalUser user;
  const Details({super.key, required this.title, required this.user});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController _postController = TextEditingController();

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> getPosts() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("posts").where("category", isEqualTo: widget.title).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Post post = Post.fromJson(snapshot.data!.docs[index].data());
                  return PostWidget(post: post);
                });
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox();
          }
        });
  }

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
                  child: getPosts(),
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
                            controller: _postController,
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
                          onPressed: () {
                            if(_postController.text.isNotEmpty) {
                              Post post = Post(
                                  user: widget.user,
                                  content: _postController.text.toString(),
                                  category: widget.title
                              );

                              Database().makePost(post);

                              _postController.clear();
                            }
                          },
                          // padding: EdgeInsets.zero,
                          icon: const Icon(Icons.send)
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
