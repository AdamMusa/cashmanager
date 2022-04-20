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
      Lottie.asset("assets/success.json"),
      Lottie.asset("assets/tigo.json"),
      Lottie.asset("assets/internet.json"),
      Lottie.asset("assets/call.json"),
      Lottie.asset("assets/call_airtel.json"),
      Lottie.asset("assets/msg.json"),
      Lottie.asset("assets/money.json"),
      ],
    );
  }
}

// 2B7CDC blue
// EB142E rouge
// 514C4C coffé au lait


// https://edit.lottiefiles.com/?src=https%3A%2F%2Fassets9.lottiefiles.com%2Fpackages%2Flf20_rw7SpS.json
// https://edit.lottiefiles.com/?src=https%3A%2F%2Fassets3.lottiefiles.com%2Fpackages%2Flf20_pqnfmone.json
// https://edit.lottiefiles.com/?src=https%3A%2F%2Fassets2.lottiefiles.com%2Fpackages%2Flf20_rLfMZE.json
// https://edit.lottiefiles.com/?src=https%3A%2F%2Fassets4.lottiefiles.com%2Fpackages%2Flf20_pjomybim.json
// https://edit.lottiefiles.com/?src=https%3A%2F%2Fassets4.lottiefiles.com%2Fpackages%2Flf20_zvmuqszh.json