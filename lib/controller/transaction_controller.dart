import 'package:cashmanager/controller/home_controller.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController{
final _controller = Get.find<HomeController>();
final listRecordePending = [].obs;


@override
  void onInit() {
    super.onInit();
   listRecordePending.value = _controller.box.getAll().where((element) => element.pending==false).toList();
  }
}

