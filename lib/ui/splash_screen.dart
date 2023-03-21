


import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter8/firebase_services/splash_services.dart';

import '../firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServies SplashScreen =SplashServies();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashScreen.isLogin(context);
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:Text('rishabh kumar singh' ,style: TextStyle(fontSize: 30),) ),
    );
  }
} 