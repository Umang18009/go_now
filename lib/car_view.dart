import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/confirmation_view.dart';
import 'package:go_now/splash_screnn.dart';

class CarView extends StatefulWidget {
  Productdata productdata;

  CarView(this.productdata, {super.key});

  @override
  State<CarView> createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFADD),
      appBar: AppBar(
        title: Text("${widget.productdata.name}",
            style: const TextStyle(color: Color(0xFF000628))),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8A400),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.back)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF8A400)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                CarouselSlider(
                  items: List.generate(
                    4,
                    (index) =>Image.network(index==0?"https://newappofflutter.000webhostapp.com/${widget.productdata.img1}":index==1?"https://newappofflutter.000webhostapp.com/${widget.productdata.img2}":index==2?"https://newappofflutter.000webhostapp.com/${widget.productdata.img3}":"https://newappofflutter.000webhostapp.com/${widget.productdata.img4}", repeat: ImageRepeat.noRepeat,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                              color: Color(0xFFF8A400),
                              strokeWidth: 1,
                              value:
                              loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null),
                        );
                      },).marginAll(32),
                  ).toList(),
                  options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        imageIndex = index;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      height: 6,
                      width: 6,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (index == imageIndex)
                              ? const Color(0xFFF8A400)
                              : const Color(0xFF16B877)),
                    );
                  }),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.productdata.name}",
                    style: const TextStyle(
                        color: Color(0xFF000628),
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5,),
                Text("${widget.productdata.model}",
                    style: const TextStyle(
                        color: Color(0xFF000628))),
                const SizedBox(height: 30,),
                 Text("Status.. : ${widget.productdata.status}",
                    style: const TextStyle(
                        color: Color(0xFF000628),fontSize: 18,fontWeight: FontWeight.w500)),
                const SizedBox(height: 30,),
                const Text("ABOUT THIS CAR...",
                    style: TextStyle(
                        color: Color(0xFF000628),fontSize: 18,fontWeight: FontWeight.w500)),
                const SizedBox(height: 10,),
                 Text("${widget.productdata.description}",
                    style: TextStyle(
                        color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w300)),
                const SizedBox(height: 30,),
                const Text("KEY FEATURES...",
                    style: TextStyle(
                        color: Color(0xFF000628),fontSize: 18,fontWeight: FontWeight.w500)),
                const SizedBox(height: 10,),
                Text("Category : ${widget.productdata.catagory}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Condition :${widget.productdata.condi}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Fuel Type : ${widget.productdata.fcondition}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Seating Capacity : ${widget.productdata.seat}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Engine Capacity : ${widget.productdata.engine}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Average km : ${widget.productdata.averg}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Rent Type : ${widget.productdata.renttype}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Rent Price : ${widget.productdata.rentprice}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
                const SizedBox(height: 5,),
                Text("Required Documents : ${widget.productdata.documents}",style: const TextStyle(
                    color: Color(0xFF000628),fontSize: 14,fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            print("==============[${widget.productdata.status}]==============");
            if(widget.productdata.status.toString().removeAllWhitespace=="Available"||widget.productdata.status.toString().removeAllWhitespace=="available")
              {
                showDailog();
              }
            else
              {
                showDailogEr();
              }

                // Get.off(()=>const ConfirmationView(),transition: Transition.downToUp,duration: const Duration(milliseconds: 500));
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
                          20)))), child: const Text("Book Now")),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
  showDailog(){
    showDialog(context: context, barrierDismissible: true,builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 250),
          decoration: BoxDecoration(
            color: Color(0xFFFFFADD),
              border: Border.all(color: const Color(0xFFF8A400)),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Text("Here You can only book your desired Car",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                const SizedBox(height: 30,),
                Text("If you presed ' OK ' button you will be redirected to the Payment portal where you should pay 1000 INR as your booking confirmation which is refunded from your total Car Rent"),
                const SizedBox(height: 20,),
                Text("Book here & pick up from Nearest GO NOW showroom by TODAY",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
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
                      Get.off(()=>ConfirmationView(widget.productdata),transition: Transition.downToUp,duration: const Duration(milliseconds: 500));
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
                  const SizedBox(width: 20,),
                ],)
              ],
            ),
          ),
        ),
      );
    },);
  }
  showDailogEr(){
    showDialog(context: context, barrierDismissible: true,builder: (context) {
      return Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 300),
          decoration: BoxDecoration(
            color: Color(0xFFFFFADD),
              border: Border.all(color: const Color(0xFFF8A400)),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Text("Here You can not book this Car",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                const SizedBox(height: 20,),
                Text("This car is Not Available right now for rent",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                const SizedBox(height: 40,),
                ElevatedButton(onPressed: () {
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
                const SizedBox(width: 20,)
              ],
            ),
          ),
        ),
      );
    },);
  }
}
