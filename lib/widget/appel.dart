import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appels extends StatelessWidget {
  const Appels({ Key? key }) : super(key: key);

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
              onTap: ()=>Get.de,
              title: Text("option $index"),
              trailing: const Icon(Icons.check),
            ),
          ),
        )
      ),
    );
  }
}