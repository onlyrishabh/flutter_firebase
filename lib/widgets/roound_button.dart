// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap ;
  // final bool loading  ;
  const RoundButton({super.key, required this.title,required this.ontap, 
  // this.loading = false 
  
  
  });
         
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child: const Center(child:   
         Text('sing up' ,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
