import 'package:flutter/material.dart';

class GeneralSwitch extends StatefulWidget {
  const GeneralSwitch({Key? key}) : super(key: key);

  @override
  _GeneralSwitchState createState() => _GeneralSwitchState();
}

class _GeneralSwitchState extends State<GeneralSwitch> {
  bool isStaff = true;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isStaff,
      onChanged: (value) => setState(() => isStaff = !isStaff),
    );
  }
}
