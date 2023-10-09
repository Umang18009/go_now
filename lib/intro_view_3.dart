import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/login_view.dart';

class IntroThree extends StatefulWidget {
  const IntroThree({super.key});

  @override
  State<IntroThree> createState() => _IntroThreeState();
}

class _IntroThreeState extends State<IntroThree> {
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
            Text("Book & Go Now",style: TextStyle(color: Color(0xFFF8A400),fontSize: 32,fontWeight: FontWeight.bold)),
            Container(margin: const EdgeInsets.all(30),child: Image.asset("assets/intro3.png")),
            Text("Experience the future of car rentals with Go Now. Say goodbye to long queues and paperwork. Book, drive, and explore with ease. Your journey starts here.",style: TextStyle(fontSize: 15),),
            const SizedBox(height: 100,),
            Center(
              child: ElevatedButton(onPressed: () {
                Get.offAll(()=>const LoginView());
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
