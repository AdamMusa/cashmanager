import 'package:cashmanager/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/historic_controller.dart';
import '../database/local_database.dart';


class Historic extends GetView<HistoricController>{
  // ignore: prefer_const_constructors_in_immutables
  Historic({ Key? key }) : super(key: key);
  final historic = Get.put(HistoricController());
  final _controller  = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    print(controller.listRecodeDone);
    // print(controller.box.getAll().where((element) => element.pending==false));
    return Obx(
      ()=> controller.listRecodeDone.isEmpty?const Text("no data yet"): ListView.builder(
          itemCount: controller.listRecodeDone.length,
          itemBuilder: (context, index) => Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        
          child: Card(
            elevation: 4,
            child: ListTile(
              title: Text(controller.listRecodeDone[index].titre,style: const TextStyle(color:Colors.indigo),),
              trailing:IconButton(onPressed: (){
                _controller.box.put(LocalDatabase(
                    id: controller.listRecodeDone[index].id,
                    numero: "A moi",
                    pending: true,
                    
                  ));
               historic.listRecodeDone.value =  _controller.box.getAll().where((element) => element.pending==true).toList();
              },icon: const Icon(Icons.done_outline,color: Colors.green,)),
              subtitle: Text(controller.listRecodeDone[index].min+" "+controller.listRecodeDone[index].sms+" "+controller.listRecodeDone[index].data+" à "+controller.listRecodeDone[index].price+" valable jusqu'à "+controller.listRecodeDone[index].validity,textAlign: TextAlign.left,),
            )
          )
        )
      ),
    );
  }
}