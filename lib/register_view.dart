import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/home_page.dart';
import 'package:go_now/login_view.dart';
import 'package:http/http.dart' as http;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  ResponsClass responceClass = ResponsClass();
  bool hidePass = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: const Color(0xFFFFFADD),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 25, right: 25),
        child: SingleChildScrollView(
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
                height: 50,
              ),
              const Text(
                "Register Your self...",
                style: TextStyle(
                    color: Color(0xFF000628),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Your Name",
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
                child: TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Enter your full name...",
                      enabledBorder: null,
                      border: null,
                      focusColor: Colors.transparent,
                      focusedBorder: null,
                      disabledBorder: null,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Your Email",
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
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Enter your email address...",
                      enabledBorder: null,
                      border: null,
                      focusColor: Colors.transparent,
                      focusedBorder: null,
                      disabledBorder: null,
                      prefixIcon: Icon(Icons.email_rounded)),
                ),
              ),
              const SizedBox(
                height: 15,
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
                child: TextField(
                  controller: mobile,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter you mobile number...",
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
                child: TextField(
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
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              hidePass ? hidePass = false : hidePass = true;
                            });
                          },
                          child: hidePass
                              ? const Icon(CupertinoIcons.eye_slash)
                              : const Icon(CupertinoIcons.eye))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Confirm Password",
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
                child: TextField(
                  controller: cpassword,
                  keyboardType: TextInputType.text,
                  obscureText: hidePass,
                  decoration: InputDecoration(
                      hintText: "Enter your confirm password...",
                      enabledBorder: null,
                      border: null,
                      focusColor: Colors.transparent,
                      focusedBorder: null,
                      disabledBorder: null,
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              hidePass ? hidePass = false : hidePass = true;
                            });
                          },
                          child: hidePass
                              ? const Icon(CupertinoIcons.eye_slash)
                              : const Icon(CupertinoIcons.eye))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (name.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Center(child: Text("Please enter name"))));
                      } else if (email.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Center(child: Text("Please enter email"))));
                      } else if (mobile.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Center(child: Text("Please enter mobile number"))));
                      } else if (mobile.text.length < 10) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Center(child: Text("Mobile number should be 10 digit"))));
                      } else if (password.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Center(child: Text("Please enter password"))));
                      } else if (cpassword.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Center(child: Text("Please enter confirm password"))));
                      } else if (password.text != cpassword.text) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Center(child: Text("Please enter same confirm password"))));
                      } else {
                        sendData();
                      }
                    },
                    style: ButtonStyle(
                        fixedSize:
                            const MaterialStatePropertyAll(Size.fromWidth(200)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xFFF8A400)),
                        shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: const Text("Register")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sendData() async {
    showLoader();
    Map KeyData = {
      'Name': name.text,
      'Email': email.text,
      'Mobile': mobile.text,
      'Password': password.text
    };
    var url =
        Uri.parse('https://newappofflutter.000webhostapp.com/register.php');

    var response = await http.post(url, body: KeyData);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        responceClass = ResponsClass.fromJson(responseBody);
      });

      if (responceClass.result == "Data Added") {
        closeLoader();
        Get.offAll(() => const LoginView());
      } else {
        closeLoader();
        showDailog();
      }
    }
    else
      {
        closeLoader();
        showDailogError();
      }
  }

  showDailog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 250),
            decoration: BoxDecoration(
                color: const Color(0xFFFFFADD),
                border: Border.all(color: const Color(0xFFF8A400)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Technical Issue happend in our System",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("PLease try after Some Time"),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ButtonStyle(
                              fixedSize: const MaterialStatePropertyAll(
                                  Size.fromWidth(200)),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xFFF8A400)),
                              shape: MaterialStatePropertyAll(
                                  ContinuousRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          child: const Text("Retry")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  showDailogError() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 250),
            decoration: BoxDecoration(
                color: const Color(0xFFFFFADD),
                border: Border.all(color: const Color(0xFFF8A400)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("We have founded Server Error",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                      "Please try after Some time, it will may happend due to unstable internet connectivity or some technical issues."),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ButtonStyle(
                              fixedSize: const MaterialStatePropertyAll(
                                  Size.fromWidth(200)),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xFFF8A400)),
                              shape: MaterialStatePropertyAll(
                                  ContinuousRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          child: const Text("OK")),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  showLoader(){
    showDialog(barrierDismissible: false,context: context, builder: (context) {
      return Center(child: CircularProgressIndicator(),);
    },);
  }
  closeLoader(){Get.back();}
}

class ResponsClass {
  String? connection;
  String? result;

  ResponsClass({this.connection, this.result});

  ResponsClass.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    return data;
  }
}
