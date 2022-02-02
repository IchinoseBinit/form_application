import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_application/constants/constant.dart';
import 'package:form_application/screens/details_screen.dart';
import 'package:form_application/utils/general_alert_dialog.dart';
import 'package:form_application/widgets/general_text_field.dart';

class ContactScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsScreen(
                              nameController.text,
                              addressController.text,
                              int.parse(
                                ageController.text,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
