import 'package:baby_sitting_service_project/header_widget.dart';
import 'package:flutter/material.dart';

import '../body_ui.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Size size;
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
     var containerHeight=MediaQuery.of(context).size.height/2*3;
    return Scaffold(
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.only(top: 22),
         child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
           //header
          HeaderWidget(size: size),
          BodyUi(containerHeight: containerHeight,type: "register",),
          
         ],),
       ),
     ), 
      
    );
}
}