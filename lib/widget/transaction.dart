import 'package:cashmanager/controller/home_controller.dart';
import 'package:cashmanager/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/local_database.dart';


class Transaction extends GetView<TransactionController>{
  // ignore: prefer_const_constructors_in_immutables
  Transaction({ Key? key }) : super(key: key);
  final transaction = Get.put(TransactionController());
  final _controller  = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    print(controller.listRecordePending);
    // print(controller.box.getAll().where((element) => element.pending==false));
    return Obx(
      ()=> controller.listRecordePending.isEmpty?const Text("no data yet"): ListView.builder(
          itemCount: controller.listRecordePending.length,
          itemBuilder: (context, index) => Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        
          child: Card(
            elevation: 4,
            child: ListTile(
              title: Text(controller.listRecordePending[index].titre,style: const TextStyle(color:Colors.indigo),),
              trailing:IconButton(onPressed: (){
                 _controller.box.put(LocalDatabase(
                        id: controller.listRecordePending[index].id,
                        min: controller.listRecordePending[index]['min'],
                        sms: controller.listRecordePending[index]['sms'],
                        data: controller.listRecordePending[index]['data'],
                        code: controller.listRecordePending[index]['code'],
                        validity: controller.listRecordePending[index]['validity'],
                        price: controller.listRecordePending[index]['price'],
                        titre: controller.listRecordePending[index].titre,
                        numero: "A moi",
                        pending: false,
                        description:controller.listRecordePending[index].description,
                        
                      ));
                // _controller.box.remove(controller.listRecordePending[index].id);
               transaction.listRecordePending.value =  _controller.box.getAll().where((element) => element.pending==true).toList();
              },icon: const Icon(Icons.pending_rounded,color: Colors.indigo,)),
              subtitle: Text(controller.listRecordePending[index].min+" "+controller.listRecordePending[index].sms+" "+controller.listRecordePending[index].data+" à "+controller.listRecordePending[index].price+" valable jusqu'à "+controller.listRecordePending[index].validity,textAlign: TextAlign.left,),
            )
          )
        )
      ),
    );
  }
}