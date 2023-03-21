import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter9/utils/utils.dart';
// import 'package:flutter9/widgets/roound_button%20.dart';

import '../../widgets/roound_button.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add post'),
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
              databaseRef
                  .child(id)
                  .set({'title': postController.text.toString(),
                   'id': id,
                   }).then(
                      (value) {
                utils().toastmassage('post added');

            //     setState(() {
            //   loading =false;
            // });




              }).onError((error, stackTrace) {
                utils().toastmassage(error.toString());

            //     setState(() {
            //   loading =false;
            // });




              });
            },
          )
        ]),
      ),
    );
  }
}
