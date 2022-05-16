import 'package:flutter/material.dart';
import 'package:todo_calendar/controller/todo_controller.dart';
import 'package:todo_calendar/models/tododata.dart';

class TodoList extends StatefulWidget {
  final TodoData? todo;
  final Function? onDeleted;
  final int? index;

  const TodoList({
    Key? key,
    this.todo,
    this.onDeleted,
    this.index,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    // widget.todo!.finished =
    //     (TodoController.to.reset.value == true) ? false : widget.todo!.finished;

    print('value: ${TodoController.to.reset.value}');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: widget.todo!.finished
              ? Colors.grey.withOpacity(0.3)
              : Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
                key: widget.key,
                value: widget.todo!.finished,
                onChanged: (checked) {
                  widget.todo!.finished = checked!;
                  widget.todo!.save();
                  setState(() {});
                }),
            //Flexible 줄바꿈
            Flexible(
              child: Text(
                widget.todo!.text.toString(),
                style: TextStyle(
                    color: Colors.black,
                    decoration: widget.todo!.finished
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                widget.todo!.delete();
                widget.onDeleted!();
              },
              icon: const Icon(Icons.delete, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
