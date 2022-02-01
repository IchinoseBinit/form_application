import 'package:flutter/material.dart';

class GeneralAlertDialog {
  customAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 20,
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                width: 20,
              ),
              Text("Loading"),
            ],
          ),
        );
      },
    );
  }
}
