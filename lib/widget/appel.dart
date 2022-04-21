import 'package:cashmanager/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appels extends StatelessWidget {
  Appels({ Key? key }) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context,int index)=>
        Padding(
          padding: const EdgeInsets.only(left:8,right: 8,top:8),
          child: Card(
            elevation: 8,
            child: ListTile(
              onTap: ()=>Get.defaultDialog(
                title: "",
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
                        child: TextField(
                          onChanged: (String value){},
                          onSubmitted: (String value){},
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                               borderSide: const BorderSide(
                                 color: Colors.blue
                               )
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),

                            )
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