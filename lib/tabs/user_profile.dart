import 'package:flutter/material.dart';
import 'package:outdoor_social/authentication/auth.dart';
import 'package:outdoor_social/model/user.dart';

class UserProfile extends StatefulWidget {
  final LocalUser user;
  const UserProfile({super.key, required this.user});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Profile", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent, // Optional: Set background color if needed
                  child: ClipOval(
                    child: Image.network(
                      widget.user.imageUrl ?? "",
                      fit: BoxFit.cover,
                      width: 200, // Width should be twice the radius
                      height: 200, // Height should be twice the radius
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.user.fullName, style: const TextStyle(fontWeight: FontWeight.bold),),
                    widget.user.verified ? Image.asset("assets/images/verified.png", height: 15, fit: BoxFit.fitHeight,) : const SizedBox()
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("234"),
                        Text("posts")
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text("234"),
                        Text("followers")
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text("234"),
                        Text("following")
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey,
                  shadowColor: Colors.black45,
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Name", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(widget.user.fullName)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey,
                  shadowColor: Colors.black45,
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("DOB", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(widget.user.dob ?? "")
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey,
                  shadowColor: Colors.black45,
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Username", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(widget.user.username ?? "")
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey,
                  shadowColor: Colors.black45,
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Bio", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(widget.user.biography ?? "")
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      AuthMethods().logOut();
                    },
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: SizedBox(
                      width: width * .13,
                      // height: 50,
                      child: const Center(
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              color: Colors.white,
                              // fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
