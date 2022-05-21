import 'package:cashmanager/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Transaction extends GetView<TransactionController>{
  // ignore: prefer_const_constructors_in_immutables
  Transaction({ Key? key }) : super(key: key);
  final transaction = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    print(controller.listRecordePending);
    // print(controller.box.getAll().where((element) => element.pending==false));
    return GetBuilder<TransactionController>(
      builder: (controller)=> controller.listRecordePending.isEmpty?const Text("no data yet"): ListView.builder(
          itemCount: controller.listRecordePending.length,
          itemBuilder: (context, index) => Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        
          child: Card(
            elevation: 4,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left:28),
                  child: const Text("Vous avez acheter",textAlign: TextAlign.right,)),
                Row(
                  children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15),
                        child: controller.listRecordePending[index].pending?IconButton(
                          onPressed: (){

                          },
                          icon: const Icon(Icons.pending),
                        
                        ):IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.done),
                          
                        ),
                      ),
                      Text(controller.listRecordePending[index].min+" "+controller.listRecordePending[index].sms+" "+controller.listRecordePending[index].data + " à " +controller.listRecordePending[index].price,textAlign: TextAlign.center,),
                  ],
                ),
              ],
            )
          )
        )
      ),
    );
   
  }
}