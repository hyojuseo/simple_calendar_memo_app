import 'package:flutter/material.dart';
import 'package:todo_calendar/models/caldata.dart';


class TodoList extends StatefulWidget {
  final CalData? todo;
  final String? content;
  final Function()? delete;

  const TodoList({
    Key? key,
    this.todo,
    this.content,
    this.delete,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
                key: widget.key,
                value: false,
                onChanged: (checked) {
                  //widget.todo!.finished = checked!;
                  //setState(() {});
                }),
            //Flexible 줄바꿈
            Flexible(
              child: Text(
                widget.content!,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: widget.delete,
              icon: const Icon(Icons.delete, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}