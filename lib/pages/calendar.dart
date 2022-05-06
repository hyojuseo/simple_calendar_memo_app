import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_calendar/components/add_dialog.dart';
import 'package:todo_calendar/components/memo_list.dart';
import 'package:todo_calendar/components/todo_list.dart';
import 'package:todo_calendar/controller/calendar_controller.dart';

const TextStyle _listStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Widget get line => const Divider(color: Colors.grey);

  Widget CalTodoList(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            //임시. 원래는 selectedDay값 들어가야됨.
            CalendarController.to.today.value.toString(),
            //controller.selectedDay.value.toString(),
            style: _listStyle,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(20, (index) {
                  return TodoList(content: 'sdfasdf');
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget everyList() {
    return CalTodoList();
  }

  Widget selectedDayList() {
    print('sdfgsdfgsdfg');
    return Container();//MemoList(memo:);
    // return TodoList(
    //   //todo: CalData(text: '30', finished: false),
    //   title: '2022-05-05',
    //   content: '완료된 일들',
    // );
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
        CalendarController.to.selectedDay.value = selectedDay;
        CalendarController.to.focusedDay.value = focusedDay;
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
    // return FutureBuilder(
    //     future: context,
    //     builder: (context, snapshot) {
    //   List<CalData> todo = snapshot.data ?? [];
    //
    // });
  }
}
