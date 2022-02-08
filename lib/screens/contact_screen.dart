import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_application/constants/constant.dart';
import 'package:form_application/models/details_model.dart';
import 'package:form_application/screens/details_screen.dart';
import 'package:form_application/utils/general_alert_dialog.dart';
import 'package:form_application/widgets/general_text_field.dart';
import 'package:hive/hive.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen(this.username);

  final formKey = GlobalKey<FormState>();

  final String username;

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Contact Form
    return WillPopScope(
      onWillPop: () => GeneralAlertDialog().customAlertDialog(context),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          title: const Text("Contact Form"),
          centerTitle: true,
        ),
        body: Padding(
          padding: basePadding,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name:"),
                  const SizedBox(
                    height: 10,
                  ),
                  GeneralTextField(
                    title: "name",
                    controller: nameController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validate: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Age:"),
                  const SizedBox(
                    height: 10,
                  ),
                  GeneralTextField(
                    title: "age",
                    controller: ageController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    maxLength: 3,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(
                        RegExp("^[0-9]*"),
                      ),
                    ],
                    validate: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "Please enter your age";
                      } else if (int.parse(value) > 120) {
                        return "Please enter a valid age";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Address:"),
                  const SizedBox(
                    height: 10,
                  ),
                  GeneralTextField(
                    title: "address",
                    controller: addressController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validate: (String? value) {
                      if (value!.trim().isEmpty) {
                        return "Please enter your address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          final detailsBox =
                              Hive.box(DetailsConstants.detailsBox);
                          final List information = detailsBox
                              .get(DetailsConstants.info, defaultValue: []);
                          final info = {
                            "username": username,
                            "name": nameController.text,
                            "age": ageController.text,
                            "address": addressController.text
                          };

                          information.add(info);
                          await detailsBox.put(
                              DetailsConstants.info, information);
                          final detailsModel = DetailsModel.fromJson(info);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsScreen(
                                detailsModel,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text("Submit"),
                      // [{}]
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
