import 'package:flutter/material.dart';
import 'package:form_application/constants/constant.dart';
import 'package:form_application/constants/urls.dart';
import 'package:form_application/screens/call_api_screen.dart';
import 'package:form_application/utils/general_alert_dialog.dart';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(this.name, this.address, this.age, {Key? key})
      : super(key: key);

  final String name;
  final String address;
  final int age;

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
                "Name: $name",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Address: $address",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Age: $age",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                GeneralAlertDialog().customLoadingDialog(context);
                final response = await http.get(
                  Uri.parse(getAllTodos),
                );
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CallApiScreen(response.body),
                  ),
                );
              },
              child: Text("Call Api"),
            ),
          ],
        ),
      ),
    );
  }
}
