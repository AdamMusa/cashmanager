import 'package:cashmanager/controller/home_controller.dart';
import 'package:get/get.dart';

class HistoricController extends GetxController{
final _controller = Get.find<HomeController>();
var listRecodeDone = [].obs;

@override
  void onInit() {
    super.onInit();
    listRecodeDone.value = _controller.box.getAll().where((element) => element.pending==false).toList();
  }
}
