import 'package:get/get.dart';
import 'package:todo_calendar/controller/bottom_navi_controller.dart';
import 'package:todo_calendar/controller/calendar_controller.dart';

class InitBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(CalendarController(), permanent: true);
  }
}