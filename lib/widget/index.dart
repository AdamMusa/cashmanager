import 'package:cashmanager/widget/appel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);


Widget customItem({VoidCallback? onTap,String? lottiePath,String? text }){
  return GestureDetector(
    onTap: onTap,
  child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(lottiePath!,height: 150),
          const SizedBox(height: 10,),
          Text(text!,style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),)
        ],
      ),
  );
}

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        customItem(
          onTap: ()=>Get.to(
            const Appels(),
            transition: Transition.zoom
            ),
          lottiePath: "assets/lottie/moov_internet.json",
          text: "Activez les Appels"
        ),
        customItem(
          onTap: (){},
          lottiePath: "assets/lottie/moov_msg.json",
          text: "Activez les SMS"
        ),
        customItem(
          onTap: (){},
          lottiePath: "assets/lottie/moov.json",
          text: "Rechargez les Megas"
        ),
        customItem(
          onTap: (){},
          lottiePath: "assets/lottie/moov_money.json",
          text: "Envoyez l'argent"
        ),
        customItem(
          onTap: (){},
          lottiePath: "assets/lottie/reabonner.json",
          text: "Reabonnez"
        ),
        customItem(
          onTap: (){},
          lottiePath: "assets/lottie/electricity.json",
          text: "Rechargez l'electricité"
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
// https://edit.lottiefiles.com/?src=https%3A%2F%2Fassets10.lottiefiles.com%2Fprivate_files%2Flf30_fbn8elpr.json