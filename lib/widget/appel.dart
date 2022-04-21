import 'dart:async';

import 'package:cashmanager/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Appels extends StatelessWidget {
  Appels({ Key? key }) : super(key: key);
  final controller = Get.put(HomeController());
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appels"),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context,int index)=>
        Padding(
          padding: const EdgeInsets.only(left:8,right: 8,top:8),
          child: Card(
            elevation: 4,
            child: ListTile(
              onTap: ()=>Get.defaultDialog(
                radius: 10,
                title: "",
                actions: [
                  TextButton(onPressed: ()=>Get.close(0), child: const Text("RETOUR",style: TextStyle(color:Colors.grey),)),
                  ElevatedButton(onPressed: (){
                    if(textEditingController.text.length==8){
                      print(textEditingController.text);
                      textEditingController.text = "";
                      Get.close(0);
                      Get.defaultDialog();
                    }
                    else{
                      Get.close(0);
                      Get.defaultDialog(
                        title: "",
                        content: Column(
                          children: [
                            Lottie.asset("assets/lottie/moov_success.json",height: 140),
                            const Padding(
                              padding: EdgeInsets.only(left: 10,right:10),
                              child: Text("Votre demande est en cours de traitement",textAlign: TextAlign.center,),
                            )
                            ]
                        )
                      );

                    }

                  }, child: const Text("ACTIVEZ"))
                ],
               
                content: Obx(
                  ()=> Column(
                    children: [
                      CheckboxListTile(
                        shape: const StadiumBorder(
                          side: BorderSide(
                            color: Colors.blue
                          )
                        ),
                        title: const Text("Activer pour un autre"),
                        value: controller.autre.value, onChanged: (bool? value)=>controller.autre.value=value!
                      ),
                      const SizedBox(height: 15,),
                      Visibility(
                        visible: controller.autre.value,
                        child:Form(
                          autovalidateMode: AutovalidateMode.always,
                          child: TextFormField(
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            keyboardAppearance: Brightness.dark,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(40),
                                 borderSide: const BorderSide(
                                   color: Colors.blue
                                 )
                              ),
                              errorBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20),
                                 borderSide: const BorderSide(
                                   color: Colors.red
                                 )
                              ),
                              border: OutlineInputBorder(
                                
                                borderRadius: BorderRadius.circular(20),
                        
                              )
                            ),
                            
                            onSaved: (value){
                              if(value!.length==8){
                                print(value);
                                value = "";
                                
                              }
                            },
                            validator: (value){
                              if(value==null || value.length<8 || value.length>8){
                                return 'Numéro invalide' ;
                              }
                              return null;
                            },
                          ),
                        )
                          
                        )
                    ],
                  ),
                )
              ),
              title: Text("option $index"),
              trailing: const Icon(Icons.check),
            ),
          ),
        )
      ),
    );
  }
}