import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobetoclone/constants/collection_names.dart';
import 'package:tobetoclone/models/user.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    _getUser();
  }

  //! Bloc
  void _getUser() async {
    final firestore = FirebaseFirestore.instance;
    final userFromDb = await firestore
        .collection(Collections.USERS)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final user = UserModel.fromFireStore(userFromDb);

    // kullanıcının kayıtlı olduğu dersler
    final query = await firestore
        .collection(Collections.LESSONS)
        .where('users', arrayContains: FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(query.docs);
    query.docs.forEach((element) async {
      final dates = await element.get("dates");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Ana Sayfa"),
    );
  }
}
