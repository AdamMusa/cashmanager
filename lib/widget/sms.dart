import 'package:cashmanager/database/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class SMS extends StatelessWidget {
  SMS({ Key? key }) : super(key: key);
  final  data = Get.find<DataBase>();
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Activez les SMS"),
      ),
      body: ListView.builder(
        itemCount: data.katirSMS.length,
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
                content: Text("Voulez-vous activer ${data.katirSMS[index]['sms']} \n pour ${data.katirSMS[index]['price']} valide jusqu'à ${data.katirSMS[index]['validity']}",textAlign: TextAlign.center,),
                
                actions: [
                  
                  TextButton(onPressed: ()=>Get.close(0), child: const Text("RETOUR",style: TextStyle(color:Colors.grey),)),
                  ElevatedButton(onPressed: (){
                   
                    Get.close(0);
                    controller.openDialog();

                  }, child: const Text("ACTIVEZ"),
                  
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo
                  )
                  )
                ],
               
               
              ),
              
              title: Text(data.katirSMS[index]["price"],style: const TextStyle(color: Colors.indigo),),
              trailing: Text(data.katirSMS[index]["validity"],style: const TextStyle(color: Colors.green),),
              subtitle: Text(data.katirSMS[index]["sms"]),
            ),
          ),
        )
      ),
    );
  }
}