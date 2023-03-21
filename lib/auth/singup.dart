


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../widgets/roound_button.dart';
import 'login_screen.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter8/auth/login_screen.dart';
// import 'package:flutter8/utils/utils.dart';

// import '../widgets/roound_button .dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {

  bool loading =false;
final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  FirebaseAuth auth =FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('sing up')),
       
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                controller: emailcontroller,
                decoration: const InputDecoration(
                  hintText: 'email',
                  // helperText: 'rks.ccsc@gmail.com',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                validator:(value) {
                  if (value!.isEmpty){
                    return 'enter email';

                  }
                  return null ;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'password',
                  // helperText: 'enter password',
                  prefixIcon: Icon(Icons.lock_open),
                ),
                validator:(value) {
                  if (value!.isEmpty){
                    return 'enter password';

                  }
                  return null ;
                },
              ),
              
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              
              RoundButton(
                title: 'sing up',
                // loading: loading,
                ontap: () {
                  if(_formkey.currentState!.validate()){

                    setState(() {
                      loading =true;
                    });



                    auth.createUserWithEmailAndPassword(email: 
                    emailcontroller.text.toString(), 
                    password: passwordcontroller.text.toString(),
                    ).then((value) {

                      setState(() {
                      loading =false;
                    });

                    }).onError((error, stackTrace) {
                      utils().toastmassage(error.toString());

                      setState(() {
                      loading =false;
                    });


                    });
                  
                    

                  }
                },
              ),
              const SizedBox(height: 30,),

            Row
            (mainAxisAlignment: MainAxisAlignment.center,
              children: [
             
              Text("already have a acount?"),
              TextButton(onPressed: (){
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );

              } ,child:Text("login"))
            ],)

            ]),
      ),
    );
  }
}
