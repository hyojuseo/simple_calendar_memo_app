import 'package:get/get.dart';

class TodoController extends GetxController{
  static TodoController get to => Get.find();
  RxBool reset = false.obs;
}