import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:outdoor_social/model/post.dart';

class Database{

  saveUserInfoTo (Map<String, dynamic> userDetails) {
    FirebaseFirestore.instance.collection("users").doc(userDetails["userID"]).set(userDetails);
  }

  makePost(Post post) {
    FirebaseFirestore.instance.collection("posts").doc(post.postId).set(post.toJson());
  }

  comment() {}

  Future<String> uploadImage(File image) async{
    // Upload image to Firebase Storage
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final uploadTask = storageRef.putFile(image);
    final snapshot = await uploadTask.whenComplete(() {});

    // Get the download URL
    return await snapshot.ref.getDownloadURL();
  }

}