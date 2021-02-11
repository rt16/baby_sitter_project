import 'package:baby_sitting_service_project/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../body_ui.dart';
import '../header_widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   
   Size size;
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
     var containerHeight=MediaQuery.of(context).size.height/2*0.9;
    return Scaffold(
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
         child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
           //header
          HeaderWidget(size: size),
          BodyUi(containerHeight: containerHeight,type: "login",),
          Align(alignment: Alignment.center, child: Text("Skip ",style: TextStyle(color: accountChkTextColor,fontWeight: FontWeight.w500),))
          
         ],),
       ),
     ), 
      
    );
  }
  // Widget _headerWidget()
  // {
  //   return 
  // }
}



