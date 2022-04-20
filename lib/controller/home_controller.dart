import 'package:get/get.dart';

class HomeController extends GetxController{
   var index = 0.obs;

   switcher(value){
     index.value = value;
   }

}