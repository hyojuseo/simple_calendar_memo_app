import 'package:get/get.dart';

class TodoController extends GetxController{
  static TodoController get to => Get.find();
  RxBool reset = false.obs;
  RxInt length = 0.obs;
  RxInt lastIndex = 0.obs;

  void resetButton(){
    reset.value = true;
    update();
  }
}