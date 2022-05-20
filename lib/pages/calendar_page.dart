import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_calendar/components/add_dialog.dart';
import 'package:todo_calendar/components/calendar.dart';
import 'package:todo_calendar/controller/calendar_controller.dart';
import 'package:todo_calendar/hive_helper.dart';
import 'package:todo_calendar/models/tododata.dart';
import 'package:todo_calendar/pages/todo_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Widget get line => const Divider(color: Colors.grey);
  var cal;

  Future<void> _addTodo(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AddDialog(
          title: '매일 할 일 추가',
          okCallback: () {
            setState(() {
              HiveHelper().todoCreate(
                  TodoData(text: AddDialog.contentController!.text));
            });
            Navigator.of(context).pop();
          },
          cancelCallback: () {
            Get.back();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HiveHelper().calRead(),
        builder: (context, snapshot) {
          cal = snapshot.data ?? {};
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Calendar(cal: cal),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
                    onPressed: () {
                      setState(() {
                        CalendarController.to.focusedDay.value = DateTime.now();
                        CalendarController.to.selectedDay.value =
                            DateTime.now();
                      });
                    },
                    child: const Text(
                      'Today',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  line,
                  Expanded(
                    child: TodoPage(),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.lightGreen,
              child: const Icon(Icons.add),
              onPressed: () {
                _addTodo(context);
              },
            ),
          );
        });
  }
}
