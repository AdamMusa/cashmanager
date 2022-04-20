import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        
        Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Lottie.asset("assets/moov_internet.json",height: 150),
            const SizedBox(height: 10,),
            const Text("Activez les Appels")
          ],
        ),
       
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset("assets/moov_msg.json",height: 150),
            const SizedBox(height: 10,),
            const Text("Activez les SMS")
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Lottie.asset("assets/moov.json",height: 150),
            const SizedBox(height: 10,),
            const Text("Rechargez les Megas")

          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Lottie.asset("assets/moov_money.json",height: 150),
            const SizedBox(height: 10,),
            const Text("Envoyez l'argent")
          ],
        ),
        Column(
          children: [
            Lottie.asset("assets/moov_success.json",height: 150),
            const SizedBox(height: 10,),
            const Text("Activez les Appels")

          ],
        ),
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