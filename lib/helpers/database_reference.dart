import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbReference{
  var uid=FirebaseAuth.instance.currentUser?.uid;
  var userRef = FirebaseFirestore.instance.collection("users");
  var familyMemberRef = FirebaseFirestore.instance.collection("familyMembers");

}