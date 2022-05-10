import 'package:flutter/material.dart';

//import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_calendar/controller/calendar_controller.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<dynamic>> _events;

  @override
  void initState() {
    _events = {};
    super.initState();
  }

  Widget done() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 35,
      child: Container(
        width: 18,
        height: 18,
        decoration:
            const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: const Icon(
          Icons.done,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }

  Widget doing() {
    return Container();
  }

  Widget dont() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 35,
      child: Container(
        width: 18,
        height: 18,
        decoration:
            const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        child: const Icon(
          Icons.clear,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko-KR',
      focusedDay: CalendarController.to.focusedDay.value,
      firstDay: DateTime.utc(2010, 10, 20),
      lastDay: DateTime.utc(2040, 10, 20),

      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false, //2주단위보기 버튼 비활성화
      ),
      daysOfWeekHeight: 30,
      calendarStyle: const CalendarStyle(
        //다음달의 표시여부
        outsideDaysVisible: true,
        //평일날짜 색상
        defaultTextStyle: TextStyle(color: Colors.black),
        //주말날짜 색상
        weekendTextStyle: TextStyle(color: Colors.blue),
        holidayTextStyle: TextStyle(color: Colors.red),
        todayDecoration: BoxDecoration(
          color: Colors.lightGreen,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
      ),

      //선택한 날
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          CalendarController.to.selectedDay.value = selectedDay;
          CalendarController.to.focusedDay.value = focusedDay;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(CalendarController.to.selectedDay.value, day);
      },

      onPageChanged: (focusedDay) {
        CalendarController.to.focusedDay.value = focusedDay;
      },

      calendarBuilders:
          CalendarBuilders(markerBuilder: (context, datetime, events) {
        if (_events[datetime] == null) {
          return done();
        }
      }),
    );
  }
}
