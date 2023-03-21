

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter9/utils/utils.dart';
import 'package:flutter9/widgets/roound_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailcontroller =TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('forgot password'),
      ),
      body: Column(
      children: [

TextFormField(
  controller: emailcontroller,
  decoration: InputDecoration(
    hintText: 'email'
  ),
),
           const SizedBox(height: 40,),
          RoundButton(title: ' DS', ontap: (){
            auth.sendPasswordResetEmail(email: emailcontroller.text.toString()).then((value) {
              utils().toastmassage('we have send mail to recover mail');

            }).onError((error, stackTrace) {
              utils().toastmassage(error.toString());
            });

          }),
          
      ],
    ),);
  }
}