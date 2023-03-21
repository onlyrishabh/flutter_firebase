

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter9/firestore/add_firestore_data.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import '../auth/login_screen.dart';
import '../ui/post/add_post.dart';
import '../utils/utils.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({super.key});

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  final auth = FirebaseAuth.instance;

  
  final editController = TextEditingController();
  // final firestore =FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("FIRE STORE"),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then(
                (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ).onError((error, stackTrace) {
                utils().toastmassage(
                  error.toString(),
                );
              });
            },
            icon: Icon(Icons.logout_outlined),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          
          Expanded(
             child: ListView.builder(
              itemCount: 10,
              itemBuilder:  (context, index) {
              return ListTile(title:  Text('rishabh'),);
               
             }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFirestoreDataScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Future<void> showMyDialog(String title,String id)async{

    editController.text =title;


    return showDialog(context: context,builder:(BuildContext context) {
      return AlertDialog(title: Text('update'),
      content: Container(
        child: TextField(
          controller: editController,
          decoration: InputDecoration(
            hintText: 'edit',  
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('cancel')),
        TextButton(onPressed: (){
          Navigator.pop(context);
          
        }, child: Text('update')),

      ],);
    });
  }
}
