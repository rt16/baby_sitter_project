import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class HeaderWidget extends StatelessWidget {

  const HeaderWidget({
    Key key,
    @required this.size, this.type,
  }) : super(key: key);

  final Size size;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(          
      children: [
      Padding(
        padding: const EdgeInsets.only(top:60.0,bottom: 20),
        child: Image.asset("assets/icons/logo.png",height:size.height/6.5,),
      ),
      SizedBox(height: size.height*0.03,),
      Text(
      type=="login"?'Sign in to Continue':"Sign up to Continue",
      style: GoogleFonts.alegreyaSans(        
        fontSize: 32,
        color: headingColor,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
    ),
      // Text("Sign in to Continue",style: TextStyle(fontSize: 25,
      //  fontWeight: FontWeight.w500,color:headingColor,)),
       SizedBox(height: size.height*0.03,)
      
    ],);
  }
}