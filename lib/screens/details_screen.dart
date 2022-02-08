import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_application/constants/constant.dart';
import 'package:form_application/constants/urls.dart';
import 'package:form_application/models/details_model.dart';
import 'package:form_application/models/task_model.dart';
import 'package:form_application/screens/call_api_screen.dart';
import 'package:form_application/screens/login_screen.dart';
import 'package:form_application/utils/general_alert_dialog.dart';
import 'package:http/http.dart' as http;
// import 'package:provider';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(this.model, {Key? key}) : super(key: key);

  final DetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: basePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Name: ${model.name}",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Address: ${model.address}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Age: ${model.age}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                // String cityName = "Dharan";

                GeneralAlertDialog().customLoadingDialog(context);
                http.Response response = await http.get(
                  Uri.parse(getAllTodos),
                );
                final decodedResponse = jsonDecode(response.body) as List;
                List<TaskModel> tasksList = [];
                for (var eachResponse in decodedResponse) {
                  tasksList.add(TaskModel.fromJson(eachResponse));
                }
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CallApiScreen(tasksList),
                  ),
                );
              },
              child: const Text("Call Api"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: basePadding,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
            );
          },
          child: const Text("Logout"),
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).errorColor,
          ),
        ),
      ),
    );
  }
}
