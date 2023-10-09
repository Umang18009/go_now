import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/home_page.dart';
import 'package:go_now/splash_screnn.dart';
import 'package:http/http.dart' as http;
class ConfirmationView extends StatefulWidget {
  Productdata productdata;


  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();

  ConfirmationView(this.productdata);
}

class _ConfirmationViewState extends State<ConfirmationView> {
  bool load = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeBookingDetails().whenComplete(() => updateCarStatus());
    stopload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFADD),
        appBar: AppBar(
          title: const Text(
              "Go Now", style: TextStyle(color: Color(0xFF000628))),
          centerTitle: true,
          backgroundColor: const Color(0xFFF8A400),
        ),
        body: load ? Center(child: CircularProgressIndicator()) : ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            const SizedBox(height: 100,),
            const Center(child: Text("Thank You...",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),)),
            const SizedBox(height: 100,),
            Text("Your Booking Id : ${DateTime
                .now()
                .day}${DateTime
                .now()
                .month}${DateTime
                .now()
                .year}${DateTime
                .now()
                .hour}${DateTime
                .now()
                .minute}${DateTime
                .now()
                .second}_${DateTime
                .now()
                .millisecond}${DateTime
                .now()
                .microsecond}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            const Text(
              "Pick Up car on selected date from our nearest 'Go Now' Show Room",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            const Text(
              "Please carry the required documents when you pick up the car",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 100,),
            ElevatedButton(onPressed: () {
              Get.offAll(() => const HomePage());
            }, style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                    Size.fromWidth(200)),
                backgroundColor:
                const MaterialStatePropertyAll(
                    Color(0xFFF8A400)),
                shape: MaterialStatePropertyAll(
                    ContinuousRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            20)))), child: const Text("Go Back To Home"))
          ],
        )
    );
  }

  stopload() {
    Future.delayed(Duration(seconds: 5)).then((value) =>
    {
      setState(() {
        load = false;
      })
    });
  }

  Future<void> storeBookingDetails() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/addbookings.php');

    var response = await http.post(url,body: {
      'uid':SplashScreen.pref!.getString('Uid'),
      'bdt':"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      'ubid':"${DateTime
          .now()
          .day}${DateTime
          .now()
          .month}${DateTime
          .now()
          .year}${DateTime
          .now()
          .hour}${DateTime
          .now()
          .minute}${DateTime
          .now()
          .second}_${DateTime
          .now()
          .millisecond}${DateTime
          .now()
          .microsecond}",
      'cname':'${widget.productdata.name}',
      'cid':'${widget.productdata.id}',
      'user_name':SplashScreen.pref!.getString("Name")??"GoNow",
      'user_contact':SplashScreen.pref!.getString("Number")??"GoNow"
    });
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Booked"),)));
      updateCarStatus();
    }
    else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
        Get.offAll(()=>HomePage());
      }
  }
  Future<void> updateCarStatus() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/updateBookings.php');

    var response = await http.post(url, body: {
      'Car_Id': widget.productdata.id,
      'Car_Status': "Rented",
    });
    if (response.statusCode == 200)
  {
    getBookingData();
    getdData();
  }
  }
  Future<void> getBookingData() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/viewbookings.php');

    var response = await http.post(url,body: {'uid':SplashScreen.pref!.getString("Uid")});
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        SplashScreen.bookings=BookingsData.fromJson(responseBody);
        SplashScreen.bookings.bookingdata!.sort((a, b) {
          return a.userBookingId!.compareTo(b.userBookingId!);
        },);
      });
      Get.forceAppUpdate();

      if(SplashScreen.bookings.result!=1)
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
        Get.offAll(()=>const SplashScreen());
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
      Get.offAll(()=>const SplashScreen());
    }
  }
  getdData() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/view_car.php');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        SplashScreen.car=CarData.fromJson(responseBody);
        SplashScreen.car.productdata!.sort((a, b) {
          return a.id!.compareTo(b.id!);
        },);
      });

      if(SplashScreen.car.result!=1)
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
        Get.offAll(()=>const SplashScreen());
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
      Get.offAll(()=>const SplashScreen());
    }

  }
}