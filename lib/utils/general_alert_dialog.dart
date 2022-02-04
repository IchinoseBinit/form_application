import 'package:flutter/material.dart';

class GeneralAlertDialog {
  customLoadingDialog(BuildContext context) {
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

  Future<bool> customAlertDialog(BuildContext context) async {
    // bool toExit = false;
    return await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Do you want to exit?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("No"),
          ),
        ],
      ),
    );
  }
}
