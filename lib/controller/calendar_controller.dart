import 'package:get/get.dart';

class CalendarController extends GetxController{
  static CalendarController get to => Get.find();
  Rx selectedDay= DateTime.now().obs;
  Rx focusedDay= DateTime.now().obs;
  Rx sunday = DateTime.sunday.obs;
}