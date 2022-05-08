import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_calendar/binding/init_bindings.dart';
import 'package:todo_calendar/hive_helper.dart';
import 'package:todo_calendar/models/caldata.dart';
import 'package:todo_calendar/models/memodata.dart';
import 'package:todo_calendar/pages/home.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(MemoDataAdapter());
  Hive.registerAdapter(CalDataAdapter());
  await HiveHelper().openBox();

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitBindings(),
      home: Home(),
    );
  }
}
