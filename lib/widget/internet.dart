import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../database/database.dart';

class Internet extends StatelessWidget {
  Internet({ Key? key }) : super(key: key);
  final  data = Get.find<DataBase>();
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Activez Internet"),
      ),
      body: ListView.builder(
        itemCount: data.katirInternet.length,
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
                content: Text("Voulez-vous activer ${data.katirInternet[index]['sms']} \n  ${data.katirInternet[index]['price']} valable ${data.katirInternet[index]['validity']}",textAlign: TextAlign.center,),
                
                actions: [
                  
                  TextButton(onPressed: ()=>Get.close(0), child: const Text("RETOUR",style: TextStyle(color:Colors.grey),)),
                  ElevatedButton(onPressed: (){
                   
                    Get.close(0);
                    controller.sendDirectCode(data.katirInternet[index]['code']);
                    // controller.openDialog();

                  }, child: const Text("ACTIVEZ"),
                  
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo
                  )
                  )
                ],
               
               
              ),
              
              title: Text(data.katirInternet[index]["price"],style: const TextStyle(color: Colors.indigo),),
              trailing: Text(data.katirInternet[index]["validity"],style: const TextStyle(color: Colors.green),),
              subtitle: Text(data.katirInternet[index]["data"]),
            ),
          ),
        )
      ),
    );
    
  }
}