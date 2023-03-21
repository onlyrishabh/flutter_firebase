
// import 'dart:async';

import 'dart:async';

// import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter8/auth/login_screen.dart';
// import 'package:flutter8/ui/post/post_loginscreen.dart';
import 'package:flutter9/auth/login_screen.dart';
import 'package:flutter9/firestore/firestore_list_screen.dart';
// import 'package:flutter9/ui/post/post_loginsvcreen.dart';

class SplashServies {
  // BuildContext get context => null;
  void isLogin(BuildContext context) {


    final auth =FirebaseAuth.instance;

    final user =auth.currentUser;

    if  (user!= null){

      Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FirestoreScreen(),
        ),
      ),
    );


    }else{
      Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
    }
    
  }
}
