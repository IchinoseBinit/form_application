import 'package:flutter/material.dart';

class GeneralCheckBox extends StatefulWidget {
  const GeneralCheckBox(this.function, {Key? key}) : super(key: key);

  final Function(bool) function;

  @override
  _GeneralCheckBoxState createState() => _GeneralCheckBoxState();
}

class _GeneralCheckBoxState extends State<GeneralCheckBox> {
  late bool isAgreed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isAgreed = true;
    widget.function(isAgreed);
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isAgreed,
        onChanged: (value) {
          setState(() {
            isAgreed = value!;
          });
          widget.function(value!);
        });
  }
}
