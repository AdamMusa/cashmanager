import 'package:cashmanager/widget/appel.dart';
import 'package:cashmanager/widget/choice_option_appel.dart';
import 'package:cashmanager/widget/reabonner.dart';
import 'package:cashmanager/widget/recharger.dart';
import 'package:cashmanager/widget/send_money.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  Widget customItem({VoidCallback? onTap, String? lottiePath, String? text}) {
    return GestureDetector(
      onTap: onTap,
      child:Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Lottie.asset(lottiePath!, height: 123),
              const SizedBox(
                height: 10,
              ),
              Text(
                text!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: .9,
      primary: false,
      padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        customItem(
            onTap: () => Get.to(() => const ChoiceOptionAppel(), transition: Transition.zoom),
            lottiePath: "assets/lottie/moov.json",
            text: "Activez les Appels"),
        customItem(
            onTap: () {},
            lottiePath: "assets/lottie/moov_msg.json",
            text: "Activez les SMS"),
        customItem(
            onTap: () {},
            lottiePath: "assets/lottie/moov_internet.json",
            text: "Réchargez les Megas"),
        customItem(
            onTap: () =>Get.to(()=>SendMoney()),
            lottiePath: "assets/lottie/moov_money.json",
            text: "Envoyez l'argent"),
        customItem(
            onTap: ()=>Get.to(
              ()=>Reabonner(),
              transition: Transition.circularReveal
            ),
            lottiePath: "assets/lottie/reabonner.json",
            text: "Réabonnez"),
        customItem(
            onTap: ()=>Get.to(
              ()=>Rechargez(),
              transition: Transition.fadeIn
            ),
            lottiePath: "assets/lottie/electricity.json",
            text: "Réchargez"),
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
// https://edit.lottiefiles.com/?src=https%3A%2F%2Fassets4.lottiefiles.com%2Fprivate_files%2Flf30_jlatyxnr.json
// https://edit.lottiefiles.com/?src=https%3A%2F%2Fassets4.lottiefiles.com%2Fpackages%2Flf20_zvmuqszh.json