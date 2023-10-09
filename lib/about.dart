import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutGoNow extends StatefulWidget {
  const AboutGoNow({super.key});

  @override
  State<AboutGoNow> createState() => _AboutGoNowState();
}

class _AboutGoNowState extends State<AboutGoNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFADD),
      appBar: AppBar(
        title: const Text("ABOUT US",
            style: TextStyle(color: Color(0xFF000628))),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8A400),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.back)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("' GO NOW ' is the part of BCA 5th Sam Mini Project ",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Project Name : Car Rental Application ",style: TextStyle(color: Color(0xFFF8A400),fontSize: 18,fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Student Name : Pipaliya Umang,Tapaniya Pradip,Sutariya Prince, Savani Bansi",style: TextStyle(color: Color(0xFFF8A400),fontSize: 18,fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,top: 8),
            child: Text("Application Name : 'GO NOW' ",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,top: 8),
            child: Text("Application Language : English ",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,top: 8),
            child: Text("Application Development Language : Dart ",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,top: 8),
            child: Text("Application Development Framework : Flutter ",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,top: 8),
            child: Text("Application Development tool : Android Studio ",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,top: 8),
            child: Text("Other Development tools : Sublime editor, VS Code, 000Webhost ",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,top: 28),
            child: Text("Concept of this application",style: TextStyle(color: Color(0xFFF8A400),fontSize: 18,fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,top: 8),
            child: Text("I am developing this application based on car rental service, Where Go Now showroom owners only have an admin account where they can add, remove or update the car information\nand all around world any one can use this client side application to book car on rent\n\nHere User must create their account if they dosent\nafter that he can login using their mobile number and password\nwhene user login successfully they can see all Rental cars provided by GO NOW\n\nHere user just pay booking fees only, and get car from GO NOW show room\nWhen they go to the show room and give their booking id at that time Assistant member of GO NOW will be discussed Rental Price and all other required documents and collects the documents of customer",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8,top: 28),
            child: Center(child: Text("Thank you",style: TextStyle(color: Color(0xFFF8A400),fontSize: 18,fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}
