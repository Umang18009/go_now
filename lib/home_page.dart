import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_now/about.dart';
import 'package:go_now/booking_view.dart';
import 'package:go_now/home_view.dart';
import 'package:go_now/offer_view.dart';
import 'package:go_now/profile_view.dart';
import 'package:go_now/splash_screnn.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  static int btmIndex=0;
  static bool srch=false;
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      HomePage.btmIndex=0;
    });
  }
  GlobalKey<ScaffoldState> key=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: const Color(0xFFFFFADD),
      appBar: AppBar(
        title: const Text("Go Now", style: TextStyle(color: Color(0xFF000628))),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8A400),
        leading: IconButton(onPressed: () {key.currentState!.openDrawer();}, icon: const Icon(CupertinoIcons.bars)),
        actions: [
          IconButton(onPressed: () => Get.offAll(()=>SplashScreen()), icon: Icon(CupertinoIcons.refresh_bold))
        ],
      ),
      drawer: SafeArea(
        child: drawerView(),
      ),
      body: IndexedStack(
        index: HomePage.btmIndex,
        children: [
          const HomeView(),
          const BookingView(),
          const OfferView(),
          const ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF000628)),
            label: "Home",
            activeIcon: Icon(Icons.home, color: Color(0xFFFFFFFF)),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_repair, color: Color(0xFF000628)),
              label: "Bookings",
          activeIcon: Icon(Icons.car_repair, color: Color(0xFFFFFFFF)),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined, color: Color(0xFF000628)),
              label: "Offers",
          activeIcon: Icon(Icons.local_offer_outlined, color: Color(0xFFFFFFFF)),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_4_outlined, color: Color(0xFF000628)),
              label: "Profile",
          activeIcon: Icon(Icons.person_4_outlined, color: Color(0xFFFFFFFF)),
          ),
        ],
        onTap: (value) {
          setState(() {
            HomePage.btmIndex=value;
          });
        },
        backgroundColor: const Color(0xFFF8A400),
        selectedLabelStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        currentIndex: HomePage.btmIndex,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
  drawerView(){
    return Drawer(
      backgroundColor: const Color(0xFFFFFADD),
      child: Column(
        children: [
          const SizedBox(height: 100,),
          const Center(
              child: Text(
                "GO NOW",
                style: TextStyle(
                    color: Color(0xFFF8A400),
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 100,),
          Center(
            child: ElevatedButton(onPressed: () {
                    Get.to(()=>AboutGoNow());
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
                            20)))),child: const Text("About ' GO NOW '")),
          ),
          const SizedBox(height: 50,),
          Center(
            child: ElevatedButton(onPressed: () {
              _launchUrl();
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
                            20)))),child: const Text("Contact Developer")),
          ),
          const SizedBox(height: 50,),
          Center(
            child: ElevatedButton(onPressed: () {
              _launchUrl1();
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
                            20)))),child: const Text("Rate this app")),
          ),
          const SizedBox(height: 50,),
          Center(
            child: ElevatedButton(onPressed: () {
              _launchUrl2();
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
                            20)))),child: const Text("More Apps..")),
          ),
          const SizedBox(height: 50,),

        ],
      ),
    );
  }
  Future<void> _launchUrl() async {
    await launchUrl(Uri.parse('mailto:fluttersquare360@gmail.com?subject=GO NOW APPLICATION'));
  }  Future<void> _launchUrl1() async {
    await launchUrl(Uri.parse('https://play.google.com/store/apps/dev?id=5706992870104248619'));
  }  Future<void> _launchUrl2() async {
    await launchUrl(Uri.parse('https://play.google.com/store/apps/dev?id=5706992870104248619'));
  }
}
