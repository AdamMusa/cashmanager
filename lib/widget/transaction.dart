import 'package:cashmanager/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Transaction extends GetView<TransactionController>{
  // ignore: prefer_const_constructors_in_immutables
  Transaction({ Key? key }) : super(key: key);
  final transction = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    // print(controller.box.getAll().where((element) => element.pending==false));
    return GetBuilder(
        
        builder: (controller){
          if(controller==null){
            return const Text("empty");
          }
          return ListView.builder(
            itemCount: transction.listRecordePending.length,
            itemBuilder: (context, index) => Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
          
            child: Card(
              elevation: 4,
              child: Column(
                children: [
                  Text(transction.listRecordePending[index].validity.toString())
                ],
              ),
            )
          )
        );
      }
    );
  }
}