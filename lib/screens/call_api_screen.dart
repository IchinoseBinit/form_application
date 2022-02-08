import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:form_application/constants/constant.dart';
import 'package:form_application/models/task_model.dart';

class CallApiScreen extends StatelessWidget {
  const CallApiScreen(this.task, {Key? key}) : super(key: key);

  final List<TaskModel> task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Api"),
      ),
      body: Padding(
        padding: basePadding,
        // for (int i  =0; i< list.length; i++)
        child: ListView.separated(
          itemCount: task.length,
          itemBuilder: (context, index) {
            return buildCard(task[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
        ),
        // child: buildCard(task[101]),
      ),
    );
  }
}

Widget buildCard(TaskModel model) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        15,
      ),
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      selected: model.completed,
      selectedTileColor: Colors.grey.shade200,
      leading: CircleAvatar(
        child: Text(model.id.toString()),
      ),
      title: Text(model.title),
    ),
  );
}
