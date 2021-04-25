import 'package:get/get.dart';
import 'package:getx_application/controllers/SommeController.dart';

class SommeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SommeController>(() => SommeController());
  }
}
