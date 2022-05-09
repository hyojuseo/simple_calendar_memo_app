import 'package:get/get.dart';

class CalendarController extends GetxController{
  static CalendarController get to => Get.find();
  Rx sunday = DateTime.sunday.obs;
  Rx today = DateTime.now().obs;

}