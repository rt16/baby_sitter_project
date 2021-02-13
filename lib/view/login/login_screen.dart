import 'package:baby_sitting_service_project/common_ui_widgets/body_ui.dart';
import 'package:baby_sitting_service_project/common_ui_widgets/header_widget.dart';
import 'package:baby_sitting_service_project/constants/constants.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   
   Size size;
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
     var containerHeight=MediaQuery.of(context).size.height/2*0.9;
    return Scaffold(
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 22),
         child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
           //header
          HeaderWidget(size: size,type:"login"),
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



