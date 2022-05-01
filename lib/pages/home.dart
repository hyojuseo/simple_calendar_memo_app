import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_calendar/controller/bottom_navi_controller.dart';

const TextStyle _bottomStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  letterSpacing: 3,
  fontStyle: FontStyle.italic,
);

class Home extends GetView<BottomNavController> {
  Home({Key? key}) : super(key: key);

  // List<Widget> pages = const [
  //   Text('calendar', style: _bottomStyle),
  //   Text('memo', style: _bottomStyle),
  // ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: controller.changePage(controller
              .currentIndex.value)!,
          //pages[controller.currentIndex.value],
        ),

        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.white.withOpacity(0.4),
          ),
          child: NavigationBar(
            height: 70,
            backgroundColor: Colors.lightGreen,
            selectedIndex: controller.currentIndex.value,
            onDestinationSelected: (int newIndex) {
              controller.currentIndex.value = newIndex;
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.calendar_today_outlined), label: 'calendar'),
              NavigationDestination(icon: Icon(Icons.list_alt), label: 'memo'),
            ],
          ),
        ),
      ),
    );
  }
}
