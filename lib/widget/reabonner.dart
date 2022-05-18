import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/home_controller.dart';
class Reabonner extends StatelessWidget {
  Reabonner({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:const DelayedDisplay(
          delay: Duration(milliseconds: 305),
          child: Text("Réabonner"))
      ),
      body: Container(
        padding: const EdgeInsets.only(left:15,right: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [             
                  const SizedBox(height: 15,),

                  Lottie.asset("assets/lottie/reabonner.json",height: 200),
                  const SizedBox(height: 30,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.key),
                      hintText: "Entrer le nombre de decodeur",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const  BorderSide(
                          color:Colors.indigo
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    validator: (value){
                      if(value!.length<11 || value.length>11){
                        return "Numero du conteur invalide";
                      }
                      return controller.serie.value = value;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                      hintText: "Entrer le montant",
                      suffixIcon: const Icon(Icons.monetization_on),
                      enabledBorder: OutlineInputBorder(
                        
                        borderSide: const  BorderSide(
                          color:Colors.indigo
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                     validator: (value){
                      if(value!.length<4){
                        return "imposible de recharger avec ce montant";
                     }
                     return controller.montant.value = value;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Entrer votre mot de passe",
                      suffixIcon: const Icon(Icons.visibility),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const  BorderSide(
                          color:Colors.indigo
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    validator: (value){
                      if(value!.length<4 || value.length>4){
                        return "Le mot de passe doit etre 4 chiffre";
                      }
                      return controller.password.value = value;
                    },
                  ),
                  const SizedBox(height: 20,),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 305),
                    child: ElevatedButton(onPressed: (){}, 
                    child: const Text("Envoyez"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      minimumSize: const Size(200,40),
                      shape: const StadiumBorder(),
                      elevation: 4
                    ),
                                  ),
                  )
             ],
            )
          ),
        ),
      ),
    );
  }
}