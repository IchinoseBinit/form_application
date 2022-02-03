import 'package:flutter/material.dart';

class GeneralDropDown extends StatefulWidget {
  const GeneralDropDown(this.method, {Key? key}) : super(key: key);

  final Function(String) method;

  @override
  State<GeneralDropDown> createState() => _GeneralDropDownState();
}

class _GeneralDropDownState extends State<GeneralDropDown> {
  final List<DropdownMenuItem<String>> list = [
    const DropdownMenuItem(
      child: Text("Male"),
      value: "Male",
    ),
    const DropdownMenuItem(
      child: Text("Female"),
      value: "Female",
    ),
  ];

  String? selectedValue;

  @override
  void initState() {
    super.initState();
    // selectedValue = "Male";
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: list,
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
          widget.method(value);
        });
      },
      hint: const Text("Gender"),
      value: selectedValue,
    );
  }
}
