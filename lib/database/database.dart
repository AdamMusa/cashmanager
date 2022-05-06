import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataBase extends GetxController{
  var katirAppel = [].obs;
  var katirAppelMix = [].obs;
  var forfaitZiada = [].obs;
  var forfaitNuit = [].obs;
  var katirInter = [].obs;
  var katirSMS = [].obs;
  var katirParMoovMoney = [].obs;
  var katirInterParMoovMoney = [].obs;
  var katirInternetParMoovMoney = [].obs;
  var katirSMSParMoovMoney = [].obs;
  var katirMixParMoovMoney = [].obs;
  var ziadaParMoovMoney = [].obs;
  // var envoiMoovMoney = 
  readDataFromDatabase()async{
   String data =  await rootBundle.loadString("assets/databasemoov.json");
   final jsonResul = jsonDecode(data);
  //  print(jsonResul);
    katirAppel.value = jsonResul["Moov"]["Kattir Appels Moov"];
    katirAppelMix.value = jsonResul["Moov"]["Katir MIX"];
    forfaitZiada.value = jsonResul["Moov"]["Forfai Ziada"];
    forfaitNuit.value = jsonResul["Moov"]["CHABAB"]["Forfaits Nuit"];
    katirInter.value = jsonResul["Moov"]["Kattir International"];
    katirSMS.value = jsonResul["Moov"]["Kattir SMS"];
    katirParMoovMoney.value = jsonResul["Moov"]["Achat par Moov Money"]["kattir vers Moov"];
    katirInterParMoovMoney.value = jsonResul["Moov"]["Achat par Moov Money"]["Kattir International"];
    katirInternetParMoovMoney.value = jsonResul["Moov"]["Achat par Moov Money"]["Kattir Internet"];
    katirSMSParMoovMoney.value = jsonResul["Moov"]["Achat par Moov Money"]["Kattir SMS"];
    katirMixParMoovMoney.value = jsonResul["Moov"]["Achat par Moov Money"]["Kattir Mix"];
    ziadaParMoovMoney.value = jsonResul["Moov"]["Achat par Moov Money"]["Ziada"];
    
    print(katirAppelMix);
    // katir_appel_mix.value = jsonResul["Moov"]["Katir MIX"];
    // print(appels);
  }
}
