import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_calendar/controller/calendar_controller.dart';

const TextStyle _listStyle = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

class Calendar extends GetView<CalendarController> {
  const Calendar({Key? key}) : super(key: key);

  Widget get line => const Divider(color: Colors.grey);

  Widget everyList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'page2',
            //controller.selectedDay.value.toString(),
            style: _listStyle,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '매일 할 일들',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectedDayList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'page1',
            //controller.selectedDay.value.toString(),
            style: _listStyle,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(20, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '할 일들',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
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
        ),
        line,
        Expanded(
          child: Row(
            children: [
              Expanded(child: selectedDayList()),

              VerticalDivider(
                color: Colors.grey.withOpacity(0.3),
                thickness: 1,
              ),

              Expanded(child: everyList()),
              //Colors.orange)),
            ],
          ),
        )
      ],
    );
  }
}
