import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(          
      children: [
      Padding(
        padding: const EdgeInsets.only(top:18.0),
        child: Image.asset("assets/icons/logo.png",height:size.height/6,),
      ),
      SizedBox(height: size.height*0.03,),
      Text("Sign in to Continue",style: TextStyle(fontSize: 25,
       fontWeight: FontWeight.w500,color:headingColor,),),
       SizedBox(height: size.height*0.03,)
      
    ],);
  }
}