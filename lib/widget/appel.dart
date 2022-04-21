import 'package:cashmanager/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appels extends StatelessWidget {
  Appels({ Key? key }) : super(key: key);
  final controller = Get.put(HomeController());
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
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
                      controller.openDialog();
                    }
                    else if(controller.autre.value==false){
                      Get.close(0);
                      controller.openDialog();

                    }

                  }, child: const Text("ACTIVEZ"),
                  
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo
                  )
                  )
                ],
               
                content: Obx(
                  ()=> Column(
                    children: [
                      CheckboxListTile(
                        shape: const StadiumBorder(
                          side: BorderSide(
                            color: Colors.indigo
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
                                   color: Colors.indigo
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