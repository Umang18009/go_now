import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/home_page.dart';
import 'package:go_now/register_view.dart';
import 'package:go_now/splash_screnn.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool hidePass=true;
  TextEditingController mobile =TextEditingController();
  TextEditingController password =TextEditingController();
  UserData userData=UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFADD),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              "GO NOW",
              style: TextStyle(
                  color: Color(0xFFF8A400),
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Log In...",
              style: TextStyle(
                  color: Color(0xFF000628),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Mobile Number",
              style: TextStyle(
                  color: Color(0xFF000628),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child:  TextField(
                controller: mobile,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Enter your registered mobile number...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: Icon(Icons.phone)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Password",
              style: TextStyle(
                  color: Color(0xFF000628),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child:  TextField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: hidePass,
                decoration: InputDecoration(
                    hintText: "Enter your password...",
                    enabledBorder: null,
                    border: null,
                    focusColor: Colors.transparent,
                    focusedBorder: null,
                    disabledBorder: null,
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: InkWell(onTap: () {
                      setState(() {
                        hidePass?hidePass=false:hidePass=true;
                      });
                    },child:hidePass?const Icon(CupertinoIcons.eye_slash):const Icon(CupertinoIcons.eye) )),
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: ElevatedButton(onPressed: () {
                sendData();
                //Get.offAll(()=>const HomePage());
              },style: ButtonStyle(
                  fixedSize: const MaterialStatePropertyAll(
                      Size.fromWidth(200)),
                  backgroundColor:
                  const MaterialStatePropertyAll(
                      Color(0xFFF8A400)),
                  shape: MaterialStatePropertyAll(
                      ContinuousRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              20)))),child: const Text("Log In")),
            ),
            Center(
              child: TextButton(onPressed: () {
                Get.to(()=>const RegisterView());
              }, child: const Text("New User? Register here")),
            )
          ],
        ),
      ),
    );
  }

  sendData() async {
    showLoader();
    Map KeyData = {
      'Mobile_number': mobile.text,
      'Password': password.text
    };
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/login.php');

    var response = await http.post(url, body: KeyData);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        userData=UserData.fromJson(responseBody);
      });

      if(userData.result=="USER AVAILABLE")
        {
          SplashScreen.pref!.setBool('isHome',true);
          SplashScreen.pref!.setString("Uid", "${userData.userdata!.uid}");
          SplashScreen.pref!.setString("Name", "${userData.userdata!.name}");
          SplashScreen.pref!.setString("Email", "${userData.userdata!.email}");
          SplashScreen.pref!.setString("Number", "${userData.userdata!.numb}");
          SplashScreen.pref!.setString("Password", "${userData.userdata!.pass}");
          closeLoader();
          Get.offAll(()=>const SplashScreen());
        }
      else{
        closeLoader();
        showDailog();
      }
    }
    else{
      closeLoader();
      showDailogError();
    }

  }
  showDailog(){
    showDialog(context: context, barrierDismissible: true,builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 250),
          decoration: BoxDecoration(
              color: const Color(0xFFFFFADD),
              border: Border.all(color: const Color(0xFFF8A400)),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Text("We have not founded your credential in our system",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                const SizedBox(height: 30,),
                const Text("If you presed ' OK ' button you will be redirected to the Register Page where you can Register Your Self to use GO NOW Application"),
                const SizedBox(height: 20,),
                const SizedBox(height: 40,),
                Row(children: [
                  const SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(onPressed: () {
                      Get.back();
                    },style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(
                            Size.fromWidth(200)),
                        backgroundColor:
                        const MaterialStatePropertyAll(
                            Color(0xFFF8A400)),
                        shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    20)))),child: const Text("CANCLE")),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(onPressed: () {
                      Get.off(()=>const RegisterView(),transition: Transition.downToUp,duration: const Duration(milliseconds: 500));
                    },style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(
                            Size.fromWidth(200)),
                        backgroundColor:
                        const MaterialStatePropertyAll(
                            Color(0xFFF8A400)),
                        shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    20)))),child: const Text("Register")),
                  ),
                  const SizedBox(width: 20,),
                ],)
              ],
            ),
          ),
        ),
      );
    },);
  }
  showDailogError(){
    showDialog(context: context, barrierDismissible: true,builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 250),
          decoration: BoxDecoration(
              color: const Color(0xFFFFFADD),
              border: Border.all(color: const Color(0xFFF8A400)),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                const Text("We have founded Server Error",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                const SizedBox(height: 30,),
                const Text("Please try after Some time, it will may happend due to unstable internet connectivity or some technical issues."),
                const SizedBox(height: 20,),
                const SizedBox(height: 40,),
                Center(
                  child: Expanded(
                    child: ElevatedButton(onPressed: () {
                     Get.back();
                    },style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(
                            Size.fromWidth(200)),
                        backgroundColor:
                        const MaterialStatePropertyAll(
                            Color(0xFFF8A400)),
                        shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    20)))),child: const Text("OK")),
                  ),
                ),
                const SizedBox(width: 20,)
              ],
            ),
          ),
        ),
      );
    },);
  }
  showLoader(){
    showDialog(barrierDismissible: false,context: context, builder: (context) {
      return Center(child: CircularProgressIndicator(),);
    },);
  }
  closeLoader(){Get.back();}
}
class UserData {
  String? connection;
  String? result;
  Userdata? userdata;

  UserData({this.connection, this.result, this.userdata});

  UserData.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    userdata = json['userdata'] != null
        ? Userdata.fromJson(json['userdata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['connection'] = connection;
    data['result'] = result;
    if (userdata != null) {
      data['userdata'] = userdata!.toJson();
    }
    return data;
  }
}

class Userdata {
  String? uid;
  String? name;
  String? email;
  String? numb;
  String? pass;

  Userdata({this.uid, this.name, this.email, this.numb, this.pass});

  Userdata.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    numb = json['numb'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['numb'] = numb;
    data['pass'] = pass;
    return data;
  }
}
