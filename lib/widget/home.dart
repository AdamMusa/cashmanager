import 'package:cashmanager/controller/home_controller.dart';
import 'package:cashmanager/widget/historic.dart';
import 'package:cashmanager/widget/index.dart';
import 'package:cashmanager/widget/transaction.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

 

Widget switchScreen(value){
  switch (value) {
    case 0:
      return const Index();
    case 1:
      return Transaction();
    default:
    return Historic();
  }
}

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("MoovCM"),
        backgroundColor: Colors.indigo,
      ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: controller.index.value,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.phone_android_outlined,size: 30,color: Colors.white),
          
            Icon(Icons.compare_arrows,size: 30,color: Colors.white),
            Icon(Icons.history, size: 30,color: Colors.white),
           
          ],
          color: Colors.indigo,
          buttonBackgroundColor: Colors.indigo,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index)=>controller.switcher(index),
          letIndexChange: (index) => true,
        ),
        body: Obx(() => switchScreen(controller.index.value)
        
        )
      );
  }
}