import 'package:flutter/material.dart';
import 'package:todo_calendar/controller/calendar_controller.dart';

class CalList extends StatefulWidget {
  final String? text;
  final Function? onDeleted;
  final int? index;

  const CalList({Key? key, this.text, this.onDeleted, this.index}) : super(key: key);

  @override
  State<CalList> createState() => _CalListState();
}

class _CalListState extends State<CalList> {
  var events_temp = CalendarController.to.eventsTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: widget.key,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.text!,
                //'오늘점심밥메뉴는뭘로정할지참고민되는데말입니다.',
                style: const TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
                onPressed: () {
                  events_temp[CalendarController.to.selectedDay]!.removeAt(widget.index!);
                  widget.onDeleted!();
                },
                icon: const Icon(Icons.delete, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
