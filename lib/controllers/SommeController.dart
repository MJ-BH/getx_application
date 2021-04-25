import 'package:get/get.dart';

class SommeController extends GetxController {
  final cont1 = 0.obs;
  final cont2 = 0.obs;
  int get sum => cont1.value + cont2.value;
  increment() => cont1.value++;
  increment2() => cont2.value++;
}
