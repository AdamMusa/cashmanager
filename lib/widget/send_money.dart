import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SendMoney extends StatelessWidget {
  SendMoney({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:const DelayedDisplay(
          delay: Duration(seconds: 1),
          child: Text("Envoyez l'argent"))
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left:15,right: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Lottie.asset("assets/lottie/moov_money.json",height: 200),
                  const SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Entrer le numero du beneficiaire",
                      suffixIcon: const Icon(Icons.perm_identity),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const  BorderSide(
                          color:Colors.indigo
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      hintText: "Entrer le montant",
                     suffixIcon: const Icon(Icons.monetization_on),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const  BorderSide(
                          color:Colors.indigo
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Entrer votre mot de passe",
                     suffixIcon: const Icon(Icons.visibility),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const  BorderSide(
                          color:Colors.indigo
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  DelayedDisplay(
                    delay: const Duration(seconds: 1),
                    child: ElevatedButton(onPressed: (){}, 
                    child: const Text("Envoyez"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      minimumSize: const Size(200,40),
                      shape: const StadiumBorder(),
                      elevation: 4
                    ),
                                  ),
                  )
             ],
            )
          ),
        ),
      ),
    );
  }
}