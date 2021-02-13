import 'dart:convert';

import 'package:baby_sitting_service_project/constants/constants.dart';
import 'package:baby_sitting_service_project/model/packages_model.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Size size ;
  int _index = 0;
  PackagesModel package;
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;    
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0,  automaticallyImplyLeading: false,actions: [
      Image.asset("assets/icons/drawer.png") 
      ],),
      bottomNavigationBar:BottomNavigationBar(
      selectedItemColor: txtboxUnderLineColor,
      onTap: (newIndex) => setState(() => _index = newIndex),
      currentIndex: _index,
      items: [
        BottomNavigationBarItem(icon: Image.asset("assets/icons/home.png",height:20.0), title: Text("Home",style: TextStyle(color: textcolor),)),
        BottomNavigationBarItem(icon: Image.asset("assets/icons/package.png",height:20.0), title: Text("Packages",style: TextStyle(color: textcolor),)),
        BottomNavigationBarItem(icon: Image.asset("assets/icons/bookings.png",height:20.0), title: Text("Bookings",style: TextStyle(color: textcolor),)),
        BottomNavigationBarItem(icon: Image.asset("assets/icons/profile_icon.png",height:20.0), title: Text("Profile",style: TextStyle(color: textcolor),)),
      ],
    ),
      body:SingleChildScrollView(child: Container(
        margin: EdgeInsets.all(8),
        child: Column(children: [
          _sessionWidget(),
          _bookNowWidget(),
          _cuurentBookingWidget(),
          packagesList(),
        ],),
      ),)
      
    );
  }
  Widget packagesList()
  {
    return Column(children: [
      //title
      headingwidget("Packages"),
      ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: packagesJson.length,
        itemBuilder: (BuildContext context,int index){
          return listItem(index);
        },
      )
    ],);
  }
  Widget listItem(int index){
    package = PackagesModel.fromJson(packagesJson[index]);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [         
           Container(
             padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
            color:(index % 2 == 0) ? pinkTileColor : blueTileColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                //offset: Offset(0, 4),
                color:Colors.grey.shade200, //edited
                spreadRadius: 4,
                blurRadius: 10  //edited
              )
            
            ]),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(package.icon,height:30.0),
             RaisedButton(
                child: Text('Book Now',style: TextStyle(color: Colors.white),),
                color: (index % 2 == 0) ? pinkbookNowButtonColor : bluebookNowButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                onPressed: () {},
              ),
          ],
        ),
        SizedBox(height:20),
        //title and cost row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(package.title,style: TextStyle(color: accountChkTextColor,fontWeight: FontWeight.w700,fontSize: 20 )),
             Text("₹ "+package.cost,style: TextStyle(color: accountChkTextColor,fontWeight: FontWeight.w700,fontSize: 20 ),)
          ],
        ),
        SizedBox(height:20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(package.subtitle,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.normal,fontSize: 15 ))),             
          ],
        )
      ],),
      width: size.width,
      ),
    ],
      ),
    );
  }
  Widget headingwidget(String title)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
              children: [
              Text(title,style: TextStyle(color: headingColor,fontWeight: FontWeight.w700,fontSize: 20),)
            ],),
    );
  }
  Widget _cuurentBookingWidget()
  {
    return Column(
      children: [
        //heading
        headingwidget("Your Current Booking"),         
        SizedBox(height:12.0),
        //card
         Container(
           padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              //offset: Offset(0, 4),
              color:Colors.grey.shade200, //edited
              spreadRadius: 4,
              blurRadius: 10  //edited
            )
          
          ]),
      height: 250,
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("One Day Package",style: TextStyle(color: txtboxUnderLineColor,fontWeight: FontWeight.w400,fontSize: 18),),
          RaisedButton(
              child: Text('Start',style: TextStyle(color: Colors.white),),
              color: txtboxUnderLineColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              onPressed: () {},
            ),

        ],),
        SizedBox(height:20.0),
        //from to text
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(                
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("From",style: TextStyle(color: textcolor,fontWeight: FontWeight.w400,fontSize: 14),),
              SizedBox(height:2.0),
               datetimeLabel("assets/icons/calendar_icon.png","12.08.2021"),
               SizedBox(height:2.0),
               datetimeLabel("assets/icons/clock_icon.png","11pm"),
            ],),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("To",style: TextStyle(color: textcolor,fontWeight: FontWeight.w400,fontSize: 14),),
              SizedBox(height:2.0),
               datetimeLabel("assets/icons/calendar_icon.png","13.02.2022"),          
               SizedBox(height:2.0),
               datetimeLabel("assets/icons/clock_icon.png","7am"),
            ],),

            

        ],),
        SizedBox(height:20.0),
        Row          
        (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              buttonWidget("Rate Us",(){},Icons.star_outline),
              buttonWidget("Geolocation",(){},Icons.location_on_outlined),
              buttonWidget("Survillence",(){},Icons.supervised_user_circle_outlined),

            ],)
          
        
    ],),
    width: size.width,
    ),
    ],
    );
  }
  Widget buttonWidget(String title,Function onPress,icon)
  {
    return RaisedButton(            
        child: Row(
          children: [
            Icon(icon,color: Colors.white,size: 10,),
            Text(title,style: TextStyle(color: Colors.white,fontSize: 12.0),),
          ],
        ),
        color: headingColor,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
        onPressed: () {},
      );
  }
  Widget datetimeLabel(icon,title){
    return Row(
              children: [
                Image.asset(icon,height: 14.0,),
                SizedBox(width: 2.0,),
                Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15),),
              ],
            );
  }
  Widget _sessionWidget()
  {
    print(size);
    return Row(children: [
      CircleAvatar(radius: size.width/5/2, child: Image.asset("assets/icons/profile.png"),),
      SizedBox(width: 15,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Welcome",style: TextStyle(color: lightGrey,fontSize: 19,fontWeight: FontWeight.w500),),       
         Text("Emily Cyrus",style: TextStyle(color: txtboxUnderLineColor,fontSize: 21,fontWeight: FontWeight.w600),),
      ],)
    ],);
  }

Widget _bookNowWidget()
  {
    var outerContainerHeight=size.height/2.5;
    var outerContainerWidth=size.width;
    return Container(   
      height: outerContainerHeight,width: size.width,
    child: Stack(alignment: Alignment.centerLeft,
    children: [    
      Container(
       decoration: BoxDecoration(
       color: bookNowWidgetbackground,
       borderRadius: BorderRadius.circular(25),
       boxShadow: [
         BoxShadow(
           //offset: Offset(0, 4),
           color:Colors.grey.shade100, //edited
           spreadRadius: 4,
           blurRadius: 10  //edited
         )
       
       ]),
        height: outerContainerHeight/2,
      width: size.width/2*1.7,
      ),
      Positioned( left:1.0,bottom: 0.0, child: Image.asset("assets/icons/baby_sitter.png",height: outerContainerHeight,),),
       _childWidget(),
    ],),
  );
  }

  Widget _childWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Padding(
           padding: const EdgeInsets.only(left:18.0),
           child: Text(
            "Nanny and babysitting \n Services",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w700,color: headingColor,fontSize: 15),
        ),
         ),
          Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          width:size.width*0.3,
          child: ClipRRect(           
           borderRadius: BorderRadius.circular(29),
           child:  RaisedButton(
             child: Text('Book Now',style: TextStyle(color: Colors.white),),
             color: headingColor,
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(16.0))),
             onPressed: () {},
           ),
          ),
        ),]);
  }
}