import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataBase extends GetxController{
  var katir_appel = [].obs;
  var katir_appel_mix = [].obs;
  readDataFromDatabase()async{
   String data =  await rootBundle.loadString("assets/databasemoov.json");
   final jsonResul = jsonDecode(data);
  //  print(jsonResul);
    katir_appel.value = jsonResul["Moov"]["Kattir Appels Moov"];
    katir_appel_mix.value = jsonResul["Moov"]["Katir MIX"];
    print(katir_appel_mix);
    // katir_appel_mix.value = jsonResul["Moov"]["Katir MIX"];
    // print(appels);
  }
}
