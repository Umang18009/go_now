import 'package:flutter/material.dart';
import 'package:go_now/splash_screnn.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFADD),
      body: SplashScreen.bookings.bookingdata!=null?ListView.builder(
        itemCount: SplashScreen.bookings.bookingdata!.length,
        itemBuilder: (context, index) {
          return Container(
            width: 400,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF8A400)),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Booking ID : ${SplashScreen.bookings.bookingdata![index].userBookingId}",style: TextStyle(color: Color(0xFFF8A400),fontSize: 20,fontWeight: FontWeight.bold))),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,top: 10,bottom: 10),
                    child: Text("Booking Date : ${SplashScreen.bookings.bookingdata![index].bookingDate}",style: TextStyle(color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                  ),Padding(
                    padding: const EdgeInsets.only(left: 30,top: 10,bottom: 10),
                    child: Text("Car Name : ${SplashScreen.bookings.bookingdata![index].carName}",style: TextStyle(color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                  ),Padding(
                    padding: const EdgeInsets.only(left: 30,top: 10,bottom: 10),
                    child: Text("Your Name : ${SplashScreen.bookings.bookingdata![index].userName}",style: TextStyle(color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                  ),Padding(
                    padding: const EdgeInsets.only(left: 30,top: 10,bottom: 10),
                    child: Text("Your Contact No: ${SplashScreen.bookings.bookingdata![index].userContact}",style: TextStyle(color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
          );
        },):Center(child: Text("No Bookings Founded"),));
  }
}
