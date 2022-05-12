import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_calendar/components/add_dialog.dart';
import 'package:todo_calendar/components/calendar.dart';
import 'package:todo_calendar/components/todo_list.dart';
import 'package:todo_calendar/hive_helper.dart';
import 'package:todo_calendar/models/tododata.dart';

const TextStyle _listStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Widget get line => const Divider(color: Colors.grey);
  late List<TodoData> todo;
  var cal;

  void update() => setState(() {});

  Widget calTodoList() {
    return FutureBuilder<List<TodoData>>(
        future: HiveHelper().todoRead(),
        builder: (context, snapshot) {
          todo = snapshot.data ?? [];
          // print('todo 갯수:${todo.length}');

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Every Todo',
                  //     DateFormat('yyyy년 MM월 dd일')
                  //         .format(CalendarController.to.selectedDay.value),
                  style: _listStyle,
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(todo.length, (index) {
                        return TodoList(
                          todo: todo[index],
                          //cal: cal,
                          key: Key('${index}'),
                          onDeleted: () {
                            setState(() {});
                          },
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

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
                  line,
                  Expanded(
                    child: calTodoList(),
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
