import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_calendar/components/add_dialog.dart';
import 'package:todo_calendar/components/calendar.dart';
import 'package:todo_calendar/components/todo_list.dart';
import 'package:todo_calendar/controller/todo_controller.dart';
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

  Widget calTodo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Every Todo',
                style: _listStyle,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    TodoController.to.reset.value = true;
                    setState(() {});
                  },
                  child: const Text(
                    'reset',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ))
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: calTodoList(),
          ),
        ],
      ),
    );
  }

  Widget calTodoList() {
    return FutureBuilder<List<TodoData>>(
        future: HiveHelper().todoRead(),
        builder: (context, snapshot) {
          todo = snapshot.data ?? [];

          return SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(todo.length, (index) {
                //초기화했을때의 값을 변경해준것을 업데이트해준다.
                //if문을 실행하고 return을 실행하기때문에
                //TodoList의 widget.todo!.save()가 이후에 체크한것을 저장한다.
                if (TodoController.to.reset.value == true) {
                  todo[index].finished = false;
                  HiveHelper().todoUpdate(index, todo[index]);
                }
                return TodoList(
                  todo: todo[index],
                  key: Key('${index}'),
                  index: index,
                  onDeleted: () {
                    setState(() {});
                  },
                );
              }),
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
                    child: calTodo(),
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
