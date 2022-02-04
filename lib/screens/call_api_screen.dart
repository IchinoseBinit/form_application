import 'package:flutter/material.dart';
import 'package:form_application/constants/constant.dart';

class CallApiScreen extends StatelessWidget {
  const CallApiScreen(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Api"),
      ),
      body: Padding(
        padding: basePadding,
        child: SingleChildScrollView(child: Text(text)),
        // child: Card(
        //   child: ListTile(
        //     selected: true,
        //     selectedTileColor: Colors.amber,
        //     leading: CircleAvatar(
        //       child: Text("userId"),
        //     ),
        //     title: Text("title"),
        //   ),
        // ),
      ),
    );
  }
}
