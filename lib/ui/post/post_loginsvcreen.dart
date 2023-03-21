// import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter9/auth/login_screen.dart';
import 'package:flutter9/ui/post/add_post.dart';
import 'package:flutter9/utils/utils.dart';

class PostLoginScreen extends StatefulWidget {
  const PostLoginScreen({super.key});

  @override
  State<PostLoginScreen> createState() => _PostLoginScreenState();
}

class _PostLoginScreenState extends State<PostLoginScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('post');
  final searchFilter = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("post"),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              decoration: InputDecoration(
                hintText: 'search',
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: Text('loading'),
                itemBuilder: (context, snapshot, animation, index) {
                  final title = snapshot.child('title').value.toString();

                  if (searchFilter.text.isEmpty) {
                    return ListTile(
                      title: Text(
                        snapshot.child('title').value.toString(),
                      ),
                      subtitle: Text(
                        snapshot.child('id').value.toString(),
                      ),
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                              child: ListTile(
                                onTap: (){
                                  Navigator.pop(context);
                                  ref.child(snapshot.child('id').value.toString(),).remove();
                                },
                            leading: Icon(Icons.delete_outline),
                            title: Text('delete'),
                          )
                          ),
                          PopupMenuItem(
                            value: 1,
                              child: ListTile(

                                onTap: (){
                                  Navigator.pop(context);
                                  showMyDialog(title,snapshot.child('id').value.toString());
                                },
                            leading: Icon(Icons.edit),
                            title: Text('edit'),
                          )
                          ),
                        ],
                      ),
                    );
                  } else if (title.toLowerCase().contains(
                        searchFilter.text.toLowerCase().toLowerCase(),
                      )) {
                    return ListTile(
                      title: Text(
                        snapshot.child('title').value.toString(),
                      ),
                      subtitle: Text(
                        snapshot.child('id').value.toString(),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPostScreen(),
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
          ref.child(id).update({
            'title': editController.text.toLowerCase()
          }).then((value) {
            utils().toastmassage('post update');

          }).onError((error, stackTrace) {
            utils().toastmassage(error.toString());
          });
        }, child: Text('update')),

      ],);
    });
  }
}
