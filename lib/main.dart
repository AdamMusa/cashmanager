import 'package:cashmanager/controller/home_controller.dart';
import 'package:cashmanager/widget/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  final controller = Get.put(HomeController());
  final store = await controller.awaitStore();
  runApp(
    GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));

  store.close();

}
