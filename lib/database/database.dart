import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Database{

  saveUserInfoTo (Map<String, dynamic> userDetails) {
    FirebaseFirestore.instance.collection("users").doc(userDetails["userId"]).set(userDetails);
  }

  makePost(Map<String, dynamic> postDetails) {
    FirebaseFirestore.instance.collection("users").doc(postDetails["userId"]).set(postDetails);
  }

  comment() {}

}