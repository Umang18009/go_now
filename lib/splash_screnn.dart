import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/home_page.dart';
import 'package:go_now/intro_view_1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  static SharedPreferences? pref;
  static CarData car=CarData();
  static CarData carNew=CarData();
  static CarData carOld=CarData();
  static CarData carSport=CarData();
  static CarData carFamily=CarData();
  static OffersData offers=OffersData();
  static BookingsData bookings=BookingsData();
}


class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
  getPref().whenComplete(() {
    forNavigation();
    getBookingData();
  });
  getdData();
  getdDatacat1();
  getdDatacat2();
  getdDatacat3();
  getdDatacat4();
  getOfferData();

  print("Init State");
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFFFFAEF),
      body: Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/appLogo.png"),
          const CircularProgressIndicator()
        ],
      )
      ),
    );
  }

  forNavigation()  async {
      bool isHomePage=SplashScreen.pref!.getBool('isHome')??false;
      await Future.delayed(Duration(seconds: 4 )).whenComplete(() {
        if(isHomePage)
          {
            Get.offAll(()=>const HomePage());
          }
        else
          {
            Get.offAll(()=>const IntroOne());
          }

      });

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

  Future<void> getOfferData() async {
    var url = Uri.parse(
        'https://newappofflutter.000webhostapp.com/offers.php');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        SplashScreen.offers=OffersData.fromJson(responseBody);
      });

      if(SplashScreen.offers.result!=1)
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

  Future<void> getPref() async {
    SplashScreen.pref = await SharedPreferences.getInstance();
  }
getdDatacat1() async {
  var url = Uri.parse(
      'https://newappofflutter.000webhostapp.com/view_car_cat.php');

  var response = await http.post(url,body: {'cat':'NEW'});
  if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);
    setState(() {
      SplashScreen.carNew=CarData.fromJson(responseBody);
      SplashScreen.carNew.productdata!.sort((a, b) {
        return a.id!.compareTo(b.id!);
      },);
    });
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
  }

}
getdDatacat2() async {
  var url = Uri.parse(
      'https://newappofflutter.000webhostapp.com/view_car_cat.php');

  var response = await http.post(url,body: {'cat':'OLD'});
  if (response.statusCode == 200) {
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      setState(() {
        SplashScreen.carOld=CarData.fromJson(responseBody);
        SplashScreen.carOld.productdata!.sort((a, b) {
          return a.id!.compareTo(b.id!);
        },);
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
    }

  }}
getdDatacat3() async {
  var url = Uri.parse(
      'https://newappofflutter.000webhostapp.com/view_car_cat.php');

  var response = await http.post(url,body: {'cat':'SPORT'});
  if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);
    setState(() {
      SplashScreen.carSport=CarData.fromJson(responseBody);
      SplashScreen.carSport.productdata!.sort((a, b) {
        return a.id!.compareTo(b.id!);
      },);
    });
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
  }


}
getdDatacat4() async {
  var url = Uri.parse(
      'https://newappofflutter.000webhostapp.com/view_car_cat.php');

  var response = await http.post(url,body: {'cat':'FAMILY'});
  if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);
    setState(() {
      SplashScreen.carFamily=CarData.fromJson(responseBody);
      SplashScreen.carFamily.productdata!.sort((a, b) {
        return a.id!.compareTo(b.id!);
      },);
    });
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Server Connection Error"),)));
  }
}
}

class CarData {
  String? connection;
  int? result;
  List<Productdata>? productdata;

  CarData({this.connection, this.result, this.productdata});

  CarData.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    if (json['productdata'] != null) {
      productdata = <Productdata>[];
      json['productdata'].forEach((v) {
        productdata!.add(Productdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['connection'] = connection;
    data['result'] = result;
    if (productdata != null) {
      data['productdata'] = productdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Productdata {
  String? id;
  String? name;
  String? model;
  String? status;
  String? description;
  String? catagory;
  String? condi;
  String? fcondition;
  String? seat;
  String? engine;
  String? averg;
  String? renttype;
  String? rentprice;
  String? documents;
  String? img1;
  String? img2;
  String? img3;
  String? img4;

  Productdata(
      {this.id,
        this.name,
        this.model,
        this.status,
        this.description,
        this.catagory,
        this.condi,
        this.fcondition,
        this.seat,
        this.engine,
        this.averg,
        this.renttype,
        this.rentprice,
        this.documents,
        this.img1,
        this.img2,
        this.img3,
        this.img4});

  Productdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    model = json['model'];
    status = json['status'];
    description = json['description'];
    catagory = json['catagory'];
    condi = json['condi'];
    fcondition = json['fcondition'];
    seat = json['seat'];
    engine = json['engine'];
    averg = json['averg'];
    renttype = json['renttype'];
    rentprice = json['rentprice'];
    documents = json['documents'];
    img1 = json['img1'];
    img2 = json['img2'];
    img3 = json['img3'];
    img4 = json['img4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['model'] = model;
    data['status'] = status;
    data['description'] = description;
    data['catagory'] = catagory;
    data['condi'] = condi;
    data['fcondition'] = fcondition;
    data['seat'] = seat;
    data['engine'] = engine;
    data['averg'] = averg;
    data['renttype'] = renttype;
    data['rentprice'] = rentprice;
    data['documents'] = documents;
    data['img1'] = img1;
    data['img2'] = img2;
    data['img3'] = img3;
    data['img4'] = img4;
    return data;
  }
}
class OffersData {
  String? connection;
  int? result;
  List<Offerdata>? offerdata;

  OffersData({this.connection, this.result, this.offerdata});

  OffersData.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    if (json['offerdata'] != null) {
      offerdata = <Offerdata>[];
      json['offerdata'].forEach((v) {
        offerdata!.add(new Offerdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    if (this.offerdata != null) {
      data['offerdata'] = this.offerdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offerdata {
  String? offerId;
  String? offerName;
  String? offerDesc;
  String? offerDate;
  String? offerCode;

  Offerdata({this.offerId, this.offerName, this.offerDesc, this.offerDate, this.offerCode});

  Offerdata.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    offerName = json['offer_name'];
    offerDesc = json['offer_desc'];
    offerDate = json['offer_date'];
    offerCode = json['offer_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offer_id'] = this.offerId;
    data['offer_name'] = this.offerName;
    data['offer_desc'] = this.offerDesc;
    data['offer_date'] = this.offerDate;
    data['offer_code'] = this.offerCode;
    return data;
  }
}
class BookingsData {
  String? connection;
  int? result;
  List<Bookingdata>? bookingdata;

  BookingsData({this.connection, this.result, this.bookingdata});

  BookingsData.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    if (json['bookingdata'] != null) {
      bookingdata = <Bookingdata>[];
      json['bookingdata'].forEach((v) {
        bookingdata!.add(new Bookingdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    if (this.bookingdata != null) {
      data['bookingdata'] = this.bookingdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookingdata {
  String? bookingId;
  String? userId;
  String? userName;
  String? userContact;
  String? bookingDate;
  String? userBookingId;
  String? carName;
  String? carId;

  Bookingdata(
      {this.bookingId, this.userId,this.userName,this.userContact, this.bookingDate, this.userBookingId,this.carName,this.carId});

  Bookingdata.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    userId = json['user_id'];
    userName=json['user_name'];
    userContact=json['user_contact'];
    bookingDate = json['booking_date'];
    userBookingId = json['user_booking_id'];
    carName=json['car_name'];
    carId=json['car_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['user_id'] = this.userId;
    data['user_name']=this.userName;
    data['user_contact']=this.userContact;
    data['booking_date'] = this.bookingDate;
    data['user_booking_id'] = this.userBookingId;
    data['car_name'] = this.carName;
    data['car_id'] = this.carId;
    return data;
  }
}


