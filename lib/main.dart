import 'package:flutter/material.dart';
import 'package:work_schedule/screens/screen_home.dart';
import 'package:work_schedule/screens/screen_scheduling.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        title: 'Work Schedule',
        home: SchedulingScreen(
          message: "",
          oldMessage: '',
          selectedWeekDays: [],
          selectedSession: [],
        ));
  }
}
