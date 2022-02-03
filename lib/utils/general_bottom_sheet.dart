import 'package:flutter/material.dart';
import 'package:form_application/constants/constant.dart';

class GeneralBottomSheet {
  customBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      builder: (context) {
        return Padding(
          padding: basePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Do yo want to register?",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("Yes"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text("No"),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
