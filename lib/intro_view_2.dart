import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/intro_view_3.dart';

class IntroTwo extends StatefulWidget {
  const IntroTwo({super.key});

  @override
  State<IntroTwo> createState() => _IntroTwoState();
}

class _IntroTwoState extends State<IntroTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFADD),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            Text("Rent a Car ?",style: TextStyle(color: Color(0xFFF8A400),fontSize: 32,fontWeight: FontWeight.bold)),
            Container(margin: const EdgeInsets.all(30),child: Image.asset("assets/intro2.png")),
            Text("Choose from our diverse fleet of vehicles, tailored to suit your every need. With Go Now, you're just a tap away from unlocking your next adventure.",style: TextStyle(fontSize: 15),),
            const SizedBox(height: 100,),
            Center(
              child: ElevatedButton(onPressed: () {
                Get.offAll(()=>const IntroThree());
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
                              20)))),child: const Text("Next")),
            ),
          ],
        ),
      ),
    );
  }
}
