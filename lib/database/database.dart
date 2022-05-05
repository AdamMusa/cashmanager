import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataBase extends GetxController{
  var katirAppel = [].obs;
  var katirAppelMix = [].obs;
  readDataFromDatabase()async{
   String data =  await rootBundle.loadString("assets/databasemoov.json");
   final jsonResul = jsonDecode(data);
  //  print(jsonResul);
    katirAppel.value = jsonResul["Moov"]["Kattir Appels Moov"];
    katirAppelMix.value = jsonResul["Moov"]["Katir MIX"];
    print(katirAppelMix);
    // katir_appel_mix.value = jsonResul["Moov"]["Katir MIX"];
    // print(appels);
  }
}
