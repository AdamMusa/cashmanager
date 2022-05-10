import 'package:cashmanager/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Appels extends StatelessWidget {
  String title = "";
  List data = [];
  Appels({ Key? key ,required this.title,required this.data}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(HomeController());
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,int index)=>
        Padding(
          padding: const EdgeInsets.only(left:8,right: 8,top:8),
          child: Card(
            elevation: 4,
            child: ListTile(
              onTap: ()=>Get.defaultDialog(
                barrierDismissible: false,
                radius: 10,
                title: "Activation du forfait",
                actions: [
                  
                  TextButton(onPressed: ()=>Get.close(0), child: const Text("RETOUR",style: TextStyle(color:Colors.grey),)),
                  ElevatedButton(onPressed: (){
                    if(textEditingController.text.length==8 && controller.autre.value){
                      // print(textEditingController.text);
                      textEditingController.text = "";
                      Get.close(0);
                      controller.openDialog();
                    }
                    else {
                      Get.close(0);
                      controller.openDialog();

                    }

                  }, child: const Text("ACTIVEZ"),
                  
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo
                  )
                  )
                ],
               
                content:Column(
                    children: [
                      Text("Voulez-vous activer ${data[index]["min"]+" "+data[index]["sms"]+ " "+"valable " +data[index]["validity"]}",textAlign: TextAlign.center,),
                      const SizedBox(height: 10,),
                      
                    ],
                  ),
                
              ),
              title: Text(data[index]["price"],style: const TextStyle(color: Colors.indigo),),
              trailing: Text(data[index]["validity"],style: const TextStyle(color: Colors.green),),
              subtitle: Text(data[index]["min"]+" "+data[index]["sms"]),
            ),
          ),
        )
      ),
    );
  }
}