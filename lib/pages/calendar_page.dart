import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_calendar/components/add_dialog.dart';
import 'package:todo_calendar/components/calendar.dart';
import 'package:todo_calendar/components/todo_list.dart';
import 'package:todo_calendar/controller/calendar_controller.dart';
import 'package:todo_calendar/hive_helper.dart';
import 'package:todo_calendar/models/caldata.dart';

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
  late List<CalData> todo;

  void update() => setState(() {});

  Widget calTodoList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => Text(
                DateFormat('yyyy년 MM월 dd일')
                    .format(CalendarController.to.selectedDay.value),
                //임시. 원래는 selectedDay값 들어가야됨.
                //DateFormat('yyyy년 MM월 dd일').format(CalendarController.to.today.value),
                //controller.selectedDay.value.toString(),
                style: _listStyle,
              )),
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
  }

  Widget selectedDayList() {
    return Container(); //MemoList(memo:);
    // return TodoList(
    //   //todo: CalData(text: '30', finished: false),
    //   title: '2022-05-05',
    //   content: '완료된 일들',
    // );
  }

  Widget _todoList() {
    return Row(
      children: [
        Expanded(child: selectedDayList()),

        VerticalDivider(
          color: Colors.grey.withOpacity(0.3),
          thickness: 1,
        ),

        Expanded(child: calTodoList()),
        //Colors.orange)),
      ],
    );
  }

  Future<void> _addTodo(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AddDialog(
          title: '매일 할 일 추가',
          okCallback: () {
            setState(() {
              HiveHelper()
                  .calCreate(CalData(text: AddDialog.contentController!.text));
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
    return FutureBuilder<List<CalData>>(
        future: HiveHelper().calRead(),
        builder: (context, snapshot) {
          todo = snapshot.data ?? [];
          print('todo 갯수:${todo.length}');

          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const Calendar(),
                  line,
                  Expanded(
                    child: _todoList(),
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
