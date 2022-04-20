import 'package:cashmanager/controller/home_controller.dart';
import 'package:cashmanager/widget/historic.dart';
import 'package:cashmanager/widget/index.dart';
import 'package:cashmanager/widget/transaction.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

 

switchScreen(value){
  switch (value) {
    case 0:
      const Index();
      break;
    case 1:
      const Transaction();
      break;
    default:
    const Historic();
  }
}

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CashManager"),
      ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: const<Widget>[
            Icon(Icons.phone, size: 30),
            Icon(Icons.private_connectivity,size: 30),
            Icon(Icons.history, size: 30),
           
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
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