import 'package:baby_sitting_service_project/common_ui_widgets/body_ui.dart';
import 'package:baby_sitting_service_project/common_ui_widgets/header_widget.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Size size;
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
     var containerHeight=MediaQuery.of(context).size.height/2*2.5;
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