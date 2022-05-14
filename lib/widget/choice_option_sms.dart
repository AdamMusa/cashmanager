import 'package:cashmanager/database/database.dart';
import 'package:cashmanager/widget/helper_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class ChoiceOptionSMS extends StatelessWidget {
  ChoiceOptionSMS({ Key? key }) : super(key: key);
  final db = Get.find<DataBase>();
  Widget itemOption(BuildContext context,{VoidCallback? onTap,String? text}){
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          color: Colors.indigo,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top:15),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Text(text!,style: const TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
        )),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Choisir une option"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/lottie/moov_msg.json",height: 250),
              const SizedBox(height: 15),
             itemOption(context,onTap: ()=>Get.to(()=>HelperData(title: "Katir SMS", data: db.katirSMS.value)),text: "Katir SMS"),
             itemOption(context,onTap: ()=>Get.to(()=>HelperData(title: "Katir SMS ", data: db.katirSMSParMoovMoney.value)),text: "Katir SMS par Moov Monney"),
            ],
          ),
        ),
      ),
    );
  }
}