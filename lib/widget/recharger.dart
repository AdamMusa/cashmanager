import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Rechargez extends StatelessWidget {
  Rechargez({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:const  Text("Rechargez")
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
                  const SizedBox(height: 10,),
                
                  Lottie.asset("assets/lottie/electricity.json",height: 200),
                  const SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      helperText: "Entrer le numero du conteur",
                      prefixIcon: const Icon(Icons.key),
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
                      helperText: "Entrer le montant",
                      prefixIcon: const Icon(Icons.monetization_on),
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
                    obscureText: true,
                    decoration: InputDecoration(
                      helperText: "Entrer votre mot de passe",
                      prefixIcon: const Icon(Icons.visibility),
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
                  ElevatedButton(onPressed: (){}, 
                  child: const Text("Envoyez"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                    minimumSize: const Size(200,40),
                    shape: const StadiumBorder(),
                    elevation: 4
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