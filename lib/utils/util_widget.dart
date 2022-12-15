import 'package:flutter/material.dart';

class Widgets {
  daySelectWidget(
      Function() onTap, String day, Color borderColor, Color textColor) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12.0,
        ),
        child: Container(
          // height: 40,
          // width:100,
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
                child: Row(
              children: [
                Text(
                  day,
                  style: TextStyle(color: textColor),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  checkBoxWidget(Function() onTap, Color containerColor, bool value) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 32,
        // width: 32,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: containerColor),
        child: value
            ? const Icon(
                Icons.check,
                size: 30.0,
                color: Colors.white,
              )
            : const Icon(Icons.check, size: 30.0, color: Colors.white),
      ),
    );
  }

  submitButton(
    String text,
    BuildContext context,
    Function() onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        // width: MediaQuery.of(context).size.width * 0.8,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
