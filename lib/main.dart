import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_calendar/binding/init_bindings.dart';
import 'package:todo_calendar/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
