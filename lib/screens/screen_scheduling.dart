import 'package:flutter/material.dart';
import 'package:work_schedule/screens/screen_home.dart';
import 'package:work_schedule/utils/util_widget.dart';

class SchedulingScreen extends StatefulWidget {
   String message;
   List<String> selectedWeekDays = [];
   List<String> selectedSession = ["", "", "", "", "", "", ""];

   SchedulingScreen(
      {Key? key,
      required this.message,
      required this.selectedWeekDays,
      required this.selectedSession})
      : super(key: key);

  @override
  State<SchedulingScreen> createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {


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
              "${widget.message}.",
              style: theme.textTheme.bodyText1,
            ),
            const SizedBox(
              height: 24,
            ),
            widget.message.isEmpty
                ? Widgets().submitButton("ADD SCHEDULE", context, () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  HomeScreen(
                              // message: "",
                              selectedWeekDays:  [],
                              selectedSession:  ["", "", "", "", "", "", ""])),
                    );
                  })
                : Widgets().submitButton("EDIT SCHEDULE", context, () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                            // message: widget.message,
                            selectedWeekDays: widget.selectedWeekDays,
                            selectedSession: widget.selectedSession),
                      ),
                    );
                  }),
          ],
        ),
      )),
    );
  }
}
