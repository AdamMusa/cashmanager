import 'package:cashmanager/objectbox.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ussd_advanced/ussd_advanced.dart';
import '../database/database.dart';
import '../database/local_database.dart';
import 'dart:collection';
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
   var description = "".obs;
   var password = "".obs;
   var montant = "".obs;
   var serie = "".obs;
   var numero = "".obs;
   final db = Get.put(DataBase());
   late final Box<LocalDatabase> box;
   late Store _store;
   var msg = "".obs;

   switcher(value){
     index.value = value;
   }
  

  @override
  void onInit(){
    super.onInit();
    db.readDataFromDatabase();
    getDir();
  }
  

  getDir()async{
    await getApplicationDocumentsDirectory().then((dir){
      _store = Store(
        // This method is from the generated file
        getObjectBoxModel(),
        directory: dir.path+'objectbox');
    });
    box = _store.box<LocalDatabase>();
  }
  @override
  onClose(){
    _store.close();
    super.onClose();
  }

  openDialog(){
    return Get.defaultDialog(
      title: "",
      content: Column(
        children: [
          Lottie.asset("assets/lottie/moov_success.json",height: 140),
          Padding(
            padding: const EdgeInsets.only(left: 10,right:10),
            child: Text(msg.value.toString(),textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
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
    var newValue = code.replaceAll(RegExp('(1 ou 2)'), '');
    return newValue.replaceAll(RegExp(r'\(.*\)'), value);
  }
  sendCode(code,value)async{
    // print(formater(code, value));
    final  res = await UssdAdvanced.sendAdvancedUssd(subscriptionId: 1,code: formater(code, value));
    if(res !=null && res != "Votre balance est insuffisante pour le service"){
      msg.value = res;
    }
    else{
       msg.value = "Votre balance est insuffisante pour le service";
    }
  }

  sendDirectCode(code)async{
    // print(code);

    final res = await UssdAdvanced.sendAdvancedUssd(subscriptionId: 2,code: code);
     if(res !=null && res != "Votre balance est insuffisante pour le service"){
      msg.value = res;
    }
    else{
       msg.value = "Votre balance est insuffisante pour le service";
    }
  }

}