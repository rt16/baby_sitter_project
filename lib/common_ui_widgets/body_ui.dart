import 'package:baby_sitting_service_project/common_ui_widgets/login_signup_button.dart';
import 'package:baby_sitting_service_project/view/dashboard/dashboard.dart';
import 'package:baby_sitting_service_project/view/registration/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'already_have_account.dart';
import '../constants/constants.dart';

class BodyUi extends StatefulWidget {
  const BodyUi({
    Key key,
    @required this.containerHeight,
    @required this.type,

  }) : super(key: key);

  final double containerHeight;
  final String type;
  @override
  _BodyUiState createState() => _BodyUiState();
}

class _BodyUiState extends State<BodyUi> {
 final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  int _groupValue=-1;

  @override
  Widget build(BuildContext context) {
    
    return Stack(
        children: <Widget>[
        Container(        
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade100, 
            spreadRadius: 4,
            blurRadius: 10  
          )              
          ]),
              alignment: Alignment.center,
              height: widget.containerHeight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: widget.type=="login"? _loginBodyUi():_registerBodyUi()
              )
          ),
          //if login change the icon size according to the container zise
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset("assets/icons/pin.png",height:MediaQuery.of(context).size.width*0.30,),
          ),
          
        ],
      );
  }

  Widget _loginBodyUi()
  {
    return Column(                    
      children: [
        // SizedBox(height:widget.containerHeight),
        new Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height:widget.containerHeight-widget.containerHeight/1.5),
              new TextFormField(                                                                            
              decoration: new InputDecoration( 
                focusedBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: appColor, 
                    width: 1.0, 
                    style: BorderStyle.solid 
                  ),
                ),                        
              suffixIcon:Icon(Icons.mobile_friendly,color: Color(0xffE36DA6),),                 
              hintText: ' Mobile Number',
              hintStyle:TextStyle(color: Color(0xffCCCCCC)),                        
              labelStyle: TextStyle(color: Colors.blueGrey),
                enabledBorder: new UnderlineInputBorder(
                borderSide: new BorderSide(color:appColor)
              )     
              )
          ),
            SizedBox(height:widget.containerHeight/20.5),
            RoundedButton(text:"Verify",textColor: Colors.white,color: appColor,press: (){
              _navigateToRegister();
            },),
             SizedBox(height:widget.containerHeight/20.5),
            //already have account widget
            AreadyHaveAccntChk(login: true,onPress: (){
            
            
            },),
             SizedBox(height:widget.containerHeight/20.5),
            //forgot password widget
            _forgotPassword(),
            SizedBox(height:35),
           
          
            ],
          ),                   
        ),
      ],
    );
  }

  Widget _registerBodyUi()
  {
    return Column(                      
      children: [       
        new Form(
          key: _formKey,
          child: Expanded(
            child: Column(             
              children: [
                SizedBox(height:MediaQuery.of(context).size.width/5),
                //parent name
                new TextFormField(                                                                            
                decoration: new InputDecoration(
                  focusedBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: appColor, 
                    width: 1.0, 
                    style: BorderStyle.solid 
                  ),
                ),                         
                suffixIcon:Icon(Icons.person_outline_outlined,color: Color(0xffE36DA6),),                 
                hintText: ' Parent Name',
                hintStyle:TextStyle(color: Color(0xffCCCCCC)),                        
                labelStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color:appColor)
                )     
                )
            ),
            SizedBox(height:5),
            //mobile number
                new TextFormField(         
                  keyboardType: TextInputType.phone,                                                                   
                decoration: new InputDecoration(  
                  focusedBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: appColor, 
                    width: 1.0, 
                    style: BorderStyle.solid 
                  ),
                ),                       
                suffixIcon:Icon(Icons.mobile_friendly,color: Color(0xffE36DA6),),                 
                hintText: ' Mobile Number',
                hintStyle:TextStyle(color: Color(0xffCCCCCC)),                        
                labelStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color:appColor)
                )     
                )
            ),
            SizedBox(height:5),
              //Email id
                new TextFormField(                                                                            
                decoration: new InputDecoration( 
                  focusedBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: appColor, 
                    width: 1.0, 
                    style: BorderStyle.solid 
                  ),
                ),                        
                suffixIcon:Icon(Icons.email_outlined,color: Color(0xffE36DA6),),                 
                hintText: ' Email Id',
                hintStyle:TextStyle(color: Color(0xffCCCCCC)),                        
                labelStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color:appColor)
                )     
                )
            ),
            SizedBox(height: 5,),
            //city
            new TextFormField(                                                                            
                decoration: new InputDecoration( 
                focusedBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: appColor, 
                    width: 1.0, 
                    style: BorderStyle.solid 
                  ),
                ),                     
                suffixIcon:Icon(Icons.arrow_drop_down,color: Color(0xffE36DA6),),                 
                hintText: ' City',
                hintStyle:TextStyle(color: Color(0xffCCCCCC)),                        
                labelStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color:appColor)
                )     
                )
            ),
            SizedBox(height: widget.containerHeight/21,),
            //number of children
            Align( alignment: Alignment.centerLeft, child: Text("Number of Children",
            style: TextStyle(color: appColor,fontWeight: FontWeight.w600,fontSize: 15.0),)),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
           _childrenRadioButton(
              title: "1(One)",
              value: 0,
              onChanged: (newValue) => setState(() => _groupValue = newValue),
              ),
           //2
              _childrenRadioButton(
              title: "2(Two)",
              value: 1,
              onChanged: (newValue) => setState(() => _groupValue = newValue),
              ),
           //9
            _childrenRadioButton(
            title: "More",
            value: 2,
            onChanged: (newValue) => setState(() => _groupValue = newValue),
            ),
           
              ],),
            ),
            SizedBox(height: widget.containerHeight/24,),
            //city
            new TextFormField(                                                                            
                decoration: new InputDecoration(  
                focusedBorder: new UnderlineInputBorder(
                borderSide: BorderSide(
                  color: appColor, 
                  width: 1.0, 
                  style: BorderStyle.solid 
                  ),
                ),                       
                suffixIcon:Icon(Icons.arrow_drop_down,color: Color(0xffE36DA6),),                 
                hintText: ' Relation with Child',
                hintStyle:TextStyle(color: Color(0xffCCCCCC)),                        
                labelStyle: TextStyle(color: Colors.blueGrey),
                  enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(color:appColor)
                )     
                )
            ),
              SizedBox(height:50),
              RoundedButton(text:widget.type=="login"?"Verify":"Next",textColor: Colors.white,color: appColor,press: (){
               _navigateToHome();
              },),
              SizedBox(height:20),
              //already have account widget
              AreadyHaveAccntChk(login: widget.type=="login"? true:false,onPress: (){
              
              
              },),
              SizedBox(height:10),
              //forgot password widget
              widget.type=="login"?_forgotPassword():Container(width: 0,),
              SizedBox(height:35),
              //skip text 
            
              ],
            ),
          ),                   
        ),
      ],
    );
  }
  _navigateToHome(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoard()));
  }
  //radio button 
  Widget _childrenRadioButton({String title, int value, Function onChanged}) {
  return Row(
    children: [
      Transform.scale(
       scale: 1.0,
        child: new Radio(                   
        activeColor: appColor,    
         value: value,
         groupValue: _groupValue,
         onChanged: _handleRadioValueChange,
         ),
      ),
      new Text(
      title,
      style: new TextStyle(fontSize: 14.0),
      ),

    ],
  );

  }
  void _handleRadioValueChange(int value) {

    setState(() {

      _groupValue = value;


    });

  }

  _navigateToRegister()
  {
     Navigator.push(context,MaterialPageRoute(builder: (context) => Register()),);
  }
  Widget _forgotPassword()
  {
    return Text("Forgot Password ? ",style: TextStyle(color: appColor,fontWeight: FontWeight.w300),);
  }
}