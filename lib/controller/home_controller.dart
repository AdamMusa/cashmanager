
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ussd_advanced/ussd_advanced.dart';
import 'package:cashmanager/objectbox.g.dart';
import '../database/database.dart';
import '../database/local_database.dart';

class HomeController extends GetxController{
   var dropdwon = ["Cameroun","Congo","Centrafrique","Gabon","Guinée Equatorial"].obs;
   var dropdwonCameroun = ["Orange Money","MNT Money","Yup","UE Mobile Money","Guinée Equatorial"].obs;
   var dropdwonCongo = ["Cameroun","Congo","Centrafrique","Gabon","Guinée Equatorial"].obs;
   var dropdwonCentrafrique = ["Cameroun","Congo","Centrafrique","Gabon","Guinée Equatorial"].obs;
   var dropdwonGabon = ["Cameroun","Congo","Centrafrique","Gabon","Guinée Equatorial"].obs;
   var dropdwonGuine = ["Cameroun","Congo","Centrafrique","Gabon","Guinée Equatorial"].obs;
   var index = 0.obs;
   var autre = false.obs;
   var number = "".obs;
   var validate = false.obs;
   final db = Get.put(DataBase());


   get box=>getBox();
   switcher(value){
     index.value = value;
   }
  
  getBox(){
    final store = awaitStore();
    final box = store.box<LocalDatabase>();
    return  box;
  }
  awaitStore() async{
    return await openStore();
  }

  @override
  void onInit(){
    super.onInit();
    db.readDataFromDatabase();
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
      if(number.value ==""){
       return formaterHelper(code, value);
      }
      var newValue = formaterHelper(code, value);
      return newValue.replaceAll(RegExp('num'), number.value);
  }

  formaterHelper(code,value){
    var newValue = code.replaceAll(RegExp('(moi ou autre)'), '');
    return newValue.replaceAll(RegExp(r'\(.*\)'), value);
  }
  sendCode(code,value){
    UssdAdvanced.sendAdvancedUssd(subscriptionId: 1,code: formater(code, value));
  }

  sendDirectCode(code){
    UssdAdvanced.sendAdvancedUssd(subscriptionId: 2,code: code);
  }

}