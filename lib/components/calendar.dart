import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late var _selectedDay;
  late var _focusedDay;

  @override
  void initState() {
     _selectedDay = DateTime.now();
     _focusedDay = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko-KR',
      focusedDay: _focusedDay,
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
          shape:BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        )
      ),


      //선택한 날
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },

      onPageChanged: (focusedDay){
        _focusedDay= focusedDay;
      },
      // calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
      //   if (day.weekday == DateTime.sunday) {
      //     final text = DateFormat.E().format(day);
      //
      //     return Center(
      //       child: Text(
      //         text,
      //         style: TextStyle(color: Colors.red),
      //       ),
      //     );
      //   }
      // }),
    );
  }
}
