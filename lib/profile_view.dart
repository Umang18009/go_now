import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/splash_screnn.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  String Name="",Number="",Email="",Password="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFADD),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            const Center(child: Text("Your Info...",style: TextStyle(color: Color(0xFFF8A400),fontSize: 28,fontWeight: FontWeight.bold),)),
            const SizedBox(height: 50,),
            Container(
              height: 50,
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child:   Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your Name : "),
                  SizedBox(width: 10,),
                  Text("${Name}"),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child:   Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your Mobile Number : "),
                  SizedBox(width: 10,),
                  Text("${Number}"),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child:   Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your Email : "),
                  SizedBox(width: 10,),
                  Text("${Email}"),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              width: 450,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFF8A400),
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child:   Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your Password : "),
                  SizedBox(width: 10,),
                  Text("${Password}"),
                ],
              ),
            ),
            const SizedBox(height: 100,),
            Center(
              child: ElevatedButton(onPressed: () {
                SplashScreen.pref!.setBool('isHome',false);
                Get.offAll(()=>const SplashScreen());
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
                              20)))),child: const Text("Log Out")),
            ),
          ],
        ),
      ),
    );
  }

  void getUserData() {
    Name=SplashScreen.pref!.getString("Name")??"";
    Email=SplashScreen.pref!.getString("Email")??"";
    Number=SplashScreen.pref!.getString("Number")??"";
    Password=SplashScreen.pref!.getString("Password")??"";
  }
}
