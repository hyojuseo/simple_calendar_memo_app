import 'package:flutter/material.dart';
import 'package:todo_calendar/components/todo_list.dart';
import 'package:todo_calendar/controller/todo_controller.dart';
import 'package:todo_calendar/hive_helper.dart';
import 'package:todo_calendar/models/tododata.dart';

class TodoPage extends StatefulWidget {
  final bool? setValue;

  TodoPage({Key? key, this.setValue = false}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

const TextStyle _listStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

class _TodoPageState extends State<TodoPage> {
  late List<TodoData> todo;

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

  @override
  Widget build(BuildContext context) {
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
}
