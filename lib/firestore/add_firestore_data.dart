

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter9/widgets/roound_button.dart';

import '../utils/utils.dart';

class AddFirestoreDataScreen extends StatefulWidget {
  const AddFirestoreDataScreen({super.key});

  @override
  State<AddFirestoreDataScreen> createState() => _AddFirestoreDataScreenState();
}

class _AddFirestoreDataScreenState extends State<AddFirestoreDataScreen> {
  final postController = TextEditingController();
  bool loading = false;
  final firestore =FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD FIRESTORE  DATA'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          TextFormField(
            maxLines: 5,
            controller: postController,
            decoration: InputDecoration(
                hintText: 'what in your  mind', border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 30,
          ),
           RoundButton(
            title: 'add',

           

            ontap: () { 
              String id = DateTime.now().millisecondsSinceEpoch.toString();
              firestore.doc(id ).set({

                'TITLE': postController.text.toString(),
                'id': id,

              }).then((value) {

                 utils().toastmassage('post added');

              }).onError((error, stackTrace) {
                utils().toastmassage(error.toString());
              });

             
            

              
            },
          )
        ]),
      ),
    );
  }
}
