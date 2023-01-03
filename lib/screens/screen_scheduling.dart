import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:work_schedule/screens/screen_home.dart';
import 'package:work_schedule/utils/constants.dart';
import 'package:work_schedule/utils/shared_preference.dart';
import 'package:work_schedule/utils/util_widget.dart';

class SchedulingScreen extends StatefulWidget {
  String message;
  String oldMessage;
  List<String> selectedWeekDays = [];
  List<String> selectedSession = ["", "", "", "", "", "", ""];

  SchedulingScreen({
    Key? key,
    required this.message,
    required this.oldMessage,
    required this.selectedWeekDays,
    required this.selectedSession,
  }) : super(key: key);

  @override
  State<SchedulingScreen> createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  String oldSchedule = "";
  String previousData = "";
  String newMessage = "";

  String newSchedule = "";

  @override
  void initState() {
    getPrferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Work Schedule"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.oldMessage + newSchedule,
              style: theme.textTheme.bodyText1,
            ),
            Visibility(
                visible: oldSchedule.isNotEmpty,
                child: Text("(Your old Schedule is $newMessage$oldSchedule)")),
            const SizedBox(
              height: 24,
            ),
            widget.message.isEmpty
                ? Widgets().submitButton("ADD SCHEDULE", context, () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                // message: "",
                                selectedWeekDays: [],
                                selectedSession: ["", "", "", "", "", "", ""],
                              )),
                    );
                  })
                : Widgets().submitButton("EDIT SCHEDULE", context, () {
                    // String jsonString = json.encode(widget.message);
                    // print(jsonString);
                    //
                    // SharedPreference().putStringPreference(
                    //     PreferenceConstants.strOldData, jsonString);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          // message: widget.message,
                          selectedWeekDays: widget.selectedWeekDays,
                          selectedSession: widget.selectedSession,
                        ),
                      ),
                    );
                  }),
          ],
        ),
      )),
    );
  }

  getPrferences() async {
    String oldScheduleData = await SharedPreference()
        .getStringPreference(PreferenceConstants.strOldData);
    String newScheduleData = await SharedPreference()
        .getStringPreference(PreferenceConstants.strNewData);
    setState(() {
      newSchedule = newScheduleData;
      oldSchedule = oldScheduleData;
    });
    print(">>>$oldSchedule");
  }
}
