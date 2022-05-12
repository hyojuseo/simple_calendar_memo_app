import 'package:get/get.dart';

class CalendarController extends GetxController{
  static CalendarController get to => Get.find();
  Rx selectedDay = DateTime.now().obs;
  Rx focusedDay = DateTime.now().obs;
  Rx today = DateTime.now().obs;

  //calData temp
  Map<DateTime, List<dynamic>> eventsTemp = <DateTime, List<dynamic>>{};
  Map<DateTime, int> taskStateTemp = <DateTime, int>{};

}