import 'package:flutter/material.dart';
import 'package:form_application/constants/constant.dart';
import 'package:form_application/screens/login_screen.dart';
import 'package:form_application/utils/general_alert_dialog.dart';
import 'package:form_application/utils/general_bottom_sheet.dart';
import 'package:form_application/widgets/general_check_box.dart';
import 'package:form_application/widgets/general_drop_down.dart';
import 'package:form_application/widgets/general_radio_button.dart';
import 'package:form_application/widgets/general_swtich.dart';
import 'package:form_application/widgets/general_text_field.dart';
import 'package:hive/hive.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  final checkBoxController = TextEditingController();

  changeGenderValue(value) {
    genderController.text = value;
  }

  changeCheckBoxValue(bool value) {
    checkBoxController.text = value ? "Accepted" : "Not Accepted";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: basePadding,
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Register",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  getSizedBox(10),
                  Center(
                    child: Text(
                      "Create an account for using the app",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),

                  getSizedBox(10),
                  const Text("Username"),
                  getSizedBox(5),
                  GeneralTextField(
                    title: "Username",
                    controller: usernameController,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validate: (value) => value!.trim().isEmpty
                        ? "Please enter a Username"
                        : null,
                  ),
                  getSizedBox(10),
                  const Text("Password"),
                  getSizedBox(5),
                  GeneralTextField(
                    title: "Password",
                    controller: passwordController,
                    isObscure: true,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validate: (value) => value!.trim().isEmpty
                        ? "Please enter a password"
                        : null,
                  ),
                  // getSizedBox(10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text("Gender"),
                  //     GeneralDropDown(changeValue),
                  //   ],
                  // ),
                  // getSizedBox(10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: const [
                  //     Text("Staff"),
                  //     GeneralSwitch(),
                  //   ],
                  // ),
                  // getSizedBox(10),
                  // const Text("Salary"),
                  // const CustomSlider(),
                  getSizedBox(10),
                  Row(
                    children: [
                      GeneralCheckBox(changeCheckBoxValue),
                      const Text("I agree to privacy and policy"),
                    ],
                  ),
                  getSizedBox(20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        // if (formKey.currentState!.validate()) {
                        final toRegister = await GeneralBottomSheet()
                            .customBottomSheet(context);
                        if (toRegister != null) {
                          if (toRegister) {
                            GeneralAlertDialog().customLoadingDialog(context);
                            final box =
                                await Hive.openBox(UserConstants.credentialBox);
                            await Future.delayed(const Duration(seconds: 2));
                            final List usernameList = box.get(
                              UserConstants.usernameKey,
                              defaultValue: [],
                            );
                            final List passwordList = box.get(
                              UserConstants.passwordKey,
                              defaultValue: [],
                            );

                            if (usernameList
                                .contains(usernameController.text)) {
                              Navigator.of(context).pop();

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "User already exists",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else {
                              usernameList.add(usernameController.text);
                              passwordList.add(passwordController.text);

                              await box.put(
                                  UserConstants.usernameKey, usernameList);
                              await box.put(
                                  UserConstants.passwordKey, passwordList);
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }
                          }
                        }
                        // }
                      },
                      child: const Text(
                        "Register",
                      ),
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

  Widget getSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double sliderValue = 15000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: sliderValue,
          min: 15000,
          max: 100000,
          activeColor: Colors.red,
          inactiveColor: Colors.amber,
          onChanged: (value) => setState(() => sliderValue = value),
        ),
        Text("The selected value is ${sliderValue.toStringAsFixed(2)}"),
      ],
    );
  }
}
