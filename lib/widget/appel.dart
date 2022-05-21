import 'package:cashmanager/controller/home_controller.dart';
import 'package:cashmanager/database/local_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Appels extends StatelessWidget {
  String title = "";
  List data = [];
  Appels({ Key? key ,required this.title,required this.data}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<HomeController>();

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
                   
                      Get.close(0);
                      controller.sendDirectCode(data[index]['code']);
                      // controller.openDialog();
                      controller.box.put(LocalDatabase(
                        min: data[index]['min'],
                        sms: data[index]['sms'],
                        data: data[index]['data'],
                        code: data[index]['code'],
                        validity: data[index]['validity'],
                        price: data[index]['price'],
                        titre: title,
                        pending: false,
                        description:controller.description.value ,
                      ));
                      debugPrint("Activez");
                    

                  }, child: const Text("ACTIVEZ"),
                  
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo
                  )
                  )
                ],
                content:Text("Voulez-vous activer ${data[index]["min"]+" "+data[index]["sms"]+ " "+"valable " +data[index]["validity"]}",textAlign: TextAlign.center,)
              ),
              title: Text(data[index]["price"],style: const TextStyle(color: Colors.indigo),),
              trailing: Text(data[index]["validity"],style: const TextStyle(color: Colors.green),),
              subtitle: Text(data[index]["min"]+" "+data[index]["sms"]+" "+data[index]["data"]),
            ),
          ),
        )
      ),
    );
  }
}