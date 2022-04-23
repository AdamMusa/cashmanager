import 'package:cashmanager/widget/appel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class ChoiceOptionAppel extends StatelessWidget {
  const ChoiceOptionAppel({ Key? key }) : super(key: key);

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
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Choisir une option"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Lottie.asset("assets/lottie/moov.json",height: 250),
              const SizedBox(height: 15),
             itemOption(context,onTap: ()=>Get.to(
               ()=>Appels(title: "Go Night",),
               transition: Transition.leftToRightWithFade
               ),
               text: "Go night"),
             itemOption(context,onTap: (){},text: "Go Night"),
             itemOption(context,onTap: (){},text: "Go Night"),
            ],
          ),
        ),
      ),
    );
  }
}