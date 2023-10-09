import 'package:flutter/material.dart';
import 'package:go_now/splash_screnn.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFADD),
      body: SplashScreen.offers.offerdata!=null?ListView.builder(
        itemCount: SplashScreen.offers.offerdata!.length+1,
        itemBuilder: (context, index) {
        return index!=SplashScreen.offers.offerdata!.length?Container(
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
                Center(child: Text("${SplashScreen.offers.offerdata![index].offerName}",style: TextStyle(color: Color(0xFFF8A400),fontSize: 22,fontWeight: FontWeight.bold))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${SplashScreen.offers.offerdata![index].offerDesc}",style: TextStyle(color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("CODE : ${SplashScreen.offers.offerdata![index].offerCode}",style: TextStyle(color: Color(0xFFF8A400),fontSize: 14,fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${SplashScreen.offers.offerdata![index].offerDate}",style: TextStyle(color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ),
        ):Container(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("To claim this mentaioned offers please go to your nearest 'Go Now' showroom and give Offer Code at the time of Payment",style: TextStyle(color: Colors.green,fontSize: 14,fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
        );
      },):Center(child: Text("No Offers Founded."),)
    );
  }
}
