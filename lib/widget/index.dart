import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Index extends StatelessWidget {
  const Index({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
      Lottie.asset("assets/succes.json"),
      Lottie.asset("assets/success.json"),
      ],
    );
  }
}