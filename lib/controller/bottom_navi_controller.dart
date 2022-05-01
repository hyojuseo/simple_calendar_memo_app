import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_calendar/pages/calendar.dart';
import 'package:todo_calendar/pages/memo.dart';

enum PageName { CALENDAR, MEMO }

class BottomNavController extends GetxController {

  static BottomNavController get to => Get.find();
  RxInt currentIndex = 0.obs;

  Widget? changePage(int value) {
    var page = PageName.values[value];
    switch(page){
      case PageName.CALENDAR:
        return const Calendar();
      case PageName.MEMO:
        return const Memo();
    }
  }
}
