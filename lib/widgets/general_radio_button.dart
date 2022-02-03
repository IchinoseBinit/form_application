import 'package:flutter/material.dart';

class GeneralRadioButton extends StatefulWidget {
  const GeneralRadioButton(this.function, {Key? key}) : super(key: key);

  final Function(String) function;

  @override
  _GeneralRadioButtonState createState() => _GeneralRadioButtonState();
}

class _GeneralRadioButtonState extends State<GeneralRadioButton> {
  late String genderValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genderValue = "Male";
    widget.function(genderValue);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getRadio("Male"),
        const Text("Male"),
        const SizedBox(width: 20),
        getRadio("Female"),
        const Text("Female"),
      ],
    );
  }

  Widget getRadio(String value) {
    return Radio<String>(
      value: value,
      groupValue: genderValue,
      onChanged: (value) {
        setState(() {
          genderValue = value.toString();
        });
        widget.function(value!);
      },
    );
  }
}
