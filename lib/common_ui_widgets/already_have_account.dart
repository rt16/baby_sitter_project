import 'package:baby_sitting_service_project/constants/constants.dart';
import 'package:flutter/material.dart';

class AreadyHaveAccntChk extends StatelessWidget {
  final bool login;
  final Function onPress;
  const AreadyHaveAccntChk({
    Key key, this.login, this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Dont have an Account ? ",style: TextStyle(color: accountChkTextColor,fontWeight: FontWeight.w300),),
      GestureDetector(
        onTap: (){
          onPress();
        },
        child: Text(login?"Sign Up":"Sign In",style: TextStyle(color: accountChkTextColor,fontWeight: FontWeight.w700),))
    ],);
  }
}