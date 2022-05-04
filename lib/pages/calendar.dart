import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_calendar/components/add_dialog.dart';
import 'package:todo_calendar/components/todo_list.dart';
import 'package:todo_calendar/controller/calendar_controller.dart';

class Calendar extends GetView<CalendarController> {
  const Calendar({Key? key}) : super(key: key);

  Widget get line => const Divider(color: Colors.grey);

  Widget everyList() {
    return const TodoList(
      text: '매일 할 일',
      content: '매일 할 일들',
    );
  }

  Widget selectedDayList() {
    return const TodoList(
      text: '2022-05-05',
      content: '완료된 일들',
    );
  }

  Widget _calendar() {
    return TableCalendar(
      locale: 'ko-KR',
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2010, 10, 20),
      lastDay: DateTime.utc(2040, 10, 20),

      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false, //2주단위보기 버튼 비활성화
      ),
      calendarStyle: const CalendarStyle(
        //다음달의 표시여부
        outsideDaysVisible: true,
        //평일날짜 색상
        defaultTextStyle: TextStyle(color: Colors.black),
        //주말날짜 색상
        weekendTextStyle: TextStyle(color: Colors.blue),
        holidayTextStyle: TextStyle(color: Colors.red),
      ),
      //선택한 날
      onDaySelected: (selectedDay, focusedDay) {
        controller.selectedDay.value = selectedDay;
        controller.focusedDay.value = focusedDay;
      },
    );
  }

  Widget _todoList() {
    return Row(
      children: [
        Expanded(child: selectedDayList()),

        VerticalDivider(
          color: Colors.grey.withOpacity(0.3),
          thickness: 1,
        ),

        Expanded(child: everyList()),
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
            Get.back();
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _calendar(),
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
  }
}
