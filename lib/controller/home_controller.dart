
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class HomeController extends GetxController{
   var index = 0.obs;
   var autre = false.obs;
   var number = "".obs;
   var validate = false.obs;
   switcher(value){
     index.value = value;
   }

  openDialog(){
    return Get.defaultDialog(
      title: "",
      content: Column(
        children: [
          Lottie.asset("assets/lottie/moov_success.json",height: 140),
          const Padding(
            padding: EdgeInsets.only(left: 10,right:10),
            child: Text("Votre demande est en cours de traitement",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
          )
          ]
      )
    );
  }
    
  formater(code,value){
      final newValue = code.replaceAll(RegExp('(moi ou autre)'), '');
      return newValue.replaceAll(RegExp(r'\(.*\)'), value);
  }

  sendCode(){
    UssdAdvanced.sendAdvancedUssd(subscriptionId: 1,code: formater("", ""));
  }

}