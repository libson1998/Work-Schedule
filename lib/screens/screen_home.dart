import 'package:flutter/material.dart';
import 'package:work_schedule/screens/screen_scheduling.dart';
import 'package:work_schedule/utils/util_widget.dart';

class HomeScreen extends StatefulWidget {
  // final String message;
  List<String> selectedWeekDays = [];
  List<String> selectedSession = ["", "", "", "", "", "", ""];

  HomeScreen(
      {Key? key,
      // required this.message,
      required this.selectedWeekDays,
      required this.selectedSession})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;
  List<String> weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  bool isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    var height = const SizedBox(
      height: 12,
    );
    var width = const SizedBox(
      width: 12,
    );
    var divider = const Divider(
      thickness: 0.7,
    );
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Work Schedule"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              isButtonClicked
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                        strokeWidth: 4,
                        backgroundColor: Colors.deepPurpleAccent,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Set your weekly hours",
                          style:
                              theme.textTheme.subtitle2!.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: weekDays.length,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Widgets().checkBoxWidget(() {
                                        if (widget.selectedWeekDays
                                            .contains(weekDays[index])) {
                                          widget.selectedWeekDays
                                              .remove(weekDays[index]);
                                          setState(() {
                                            widget.selectedSession[index] = "";
                                          });
                                        } else {
                                          widget.selectedWeekDays
                                              .add(weekDays[index]);
                                        }
                                        setState(() {
                                          isSelected = !isSelected;
                                        });
                                      },
                                          widget.selectedWeekDays
                                                  .contains(weekDays[index])
                                              ? Colors.green
                                              : Colors.grey,
                                          isSelected),
                                      width,
                                      Text(
                                        weekDays[index],
                                        style: theme.textTheme.subtitle2,
                                      ),
                                      width,
                                      widget.selectedWeekDays
                                              .contains(weekDays[index])
                                          ? Row(
                                              children: [
                                                Widgets().daySelectWidget(
                                                  () {
                                                    String newContain = widget
                                                        .selectedSession[index];
                                                    if (widget
                                                        .selectedSession[index]
                                                        .contains("Morning")) {
                                                      newContain =
                                                          newContain.replaceAll(
                                                              "Morning", "");
                                                    } else {
                                                      newContain =
                                                          "${newContain}Morning";
                                                    }
                                                    setState(() {
                                                      widget.selectedSession[
                                                          index] = newContain;
                                                    });
                                                  },
                                                  "Morning",
                                                  widget.selectedSession[index]
                                                          .contains("Morning")
                                                      ? Colors.deepPurpleAccent
                                                      : Colors.black54,
                                                  widget.selectedSession[index]
                                                          .contains("Morning")
                                                      ? Colors.deepPurpleAccent
                                                      : Colors.black54,
                                                ),
                                                Widgets().daySelectWidget(
                                                  () {
                                                    String newContain = widget
                                                        .selectedSession[index];
                                                    if (widget
                                                        .selectedSession[index]
                                                        .contains(
                                                            "Afternoon")) {
                                                      newContain =
                                                          newContain.replaceAll(
                                                              "Afternoon", "");
                                                    } else {
                                                      newContain =
                                                          "${newContain}Afternoon";
                                                    }
                                                    setState(() {
                                                      widget.selectedSession[
                                                          index] = newContain;
                                                    });
                                                  },
                                                  "Afternoon",
                                                  widget.selectedSession[index]
                                                          .contains("Afternoon")
                                                      ? Colors.deepPurpleAccent
                                                      : Colors.black54,
                                                  widget.selectedSession[index]
                                                          .contains("Afternoon")
                                                      ? Colors.deepPurpleAccent
                                                      : Colors.black54,
                                                ),
                                                Widgets().daySelectWidget(
                                                  () {
                                                    String newContain = widget
                                                        .selectedSession[index];
                                                    if (widget
                                                        .selectedSession[index]
                                                        .contains("Evening")) {
                                                      newContain =
                                                          newContain.replaceAll(
                                                              "Evening", "");
                                                    } else {
                                                      newContain =
                                                          "${newContain}Evening";
                                                    }
                                                    setState(() {
                                                      widget.selectedSession[
                                                          index] = newContain;
                                                    });
                                                  },
                                                  "Evening",
                                                  widget.selectedSession[index]
                                                          .contains("Evening")
                                                      ? Colors.deepPurpleAccent
                                                      : Colors.black54,
                                                  widget.selectedSession[index]
                                                          .contains("Evening")
                                                      ? Colors.deepPurpleAccent
                                                      : Colors.black54,
                                                ),
                                              ],
                                            )
                                          : const Text("unavailable"),
                                    ],
                                  ),
                                  height,
                                  divider,
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Widgets().submitButton("Save", context, () async {
                  setState(() {
                    isButtonClicked = true;
                  });
                  print(widget.selectedWeekDays);
                  print(widget.selectedSession);

                  String message = "Hi Jose you are available in ";
                  for (var i = 0; i < widget.selectedSession.length; i++) {
                    if (widget.selectedSession[i].isNotEmpty) {
                      message = "$message${weekDays[i]} ";
                      if (widget.selectedSession[i].contains("Morning")) {
                        message = "${message}Morning,";
                      }
                      if (widget.selectedSession[i].contains("Afternoon")) {
                        message = "${message}Afternoon,";
                      }
                      if (widget.selectedSession[i].contains("Evening")) {
                        message = "${message}Evening,";
                      }
                      message = message.replaceAll(
                          "Morning,Afternoon,Evening", "Whole day");
                    }
                  }
                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      isButtonClicked = false;
                    });
                  });
                  print(message);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SchedulingScreen(
                            message: message,
                            selectedWeekDays: widget.selectedWeekDays,
                            selectedSession: widget.selectedSession)),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
