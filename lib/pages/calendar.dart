import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar(
            locale: 'ko-KR',
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2010, 10, 20),
            lastDay: DateTime.utc(2040, 10, 20),
          ),
          // Expanded(
          //   child: Column(
          //     children: [
          //       Container(color: Colors.green),
          //       Container(color: Colors.grey),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
