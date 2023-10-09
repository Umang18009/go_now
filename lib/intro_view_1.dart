import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/intro_view_2.dart';

class IntroOne extends StatefulWidget {
  const IntroOne({super.key});

  @override
  State<IntroOne> createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
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
            Text("Need a Car ?",style: TextStyle(color: Color(0xFFF8A400),fontSize: 32,fontWeight: FontWeight.bold)),
            Container(margin: const EdgeInsets.all(30),child: Image.asset("assets/intro1.png")),
            Text("Welcome to Go Now! Your go-to destination for hassle-free car rentals. Discover a world of convenience and freedom as you explore the easiest way to book rental cars online.",style: TextStyle(fontSize: 15),),
            const SizedBox(height: 100,),
            Center(
              child: ElevatedButton(onPressed: () {
                Get.offAll(()=>const IntroTwo());
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
