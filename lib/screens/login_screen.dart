import 'package:flutter/material.dart';
import 'package:form_application/screens/contact_screen.dart';
import 'package:form_application/utils/general_alert_dialog.dart';
import 'package:form_application/widgets/general_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Sign In with your credentials",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Login here",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Username"),
                  const SizedBox(
                    height: 5,
                  ),
                  GeneralTextField(
                    title: "username",
                    controller: usernameController,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validate: (value) => value!.trim().isEmpty
                        ? "Please enter your username"
                        : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Password"),
                  const SizedBox(
                    height: 5,
                  ),
                  GeneralTextField(
                    title: "password",
                    controller: passwordController,
                    isObscure: true,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    validate: (value) => value!.trim().isEmpty
                        ? "Please enter your password"
                        : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        // if (formKey.currentState!.validate()) {
                        final username = usernameController.text;
                        final password = passwordController.text;
                        GeneralAlertDialog().customAlertDialog(context);
                        await Future.delayed(
                          const Duration(seconds: 3),
                        );
                        Navigator.pop(context);
                        if (username == "binit" && password == "binit123") {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (_) => ContactScreen(),
                          //   ),
                          // );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ContactScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Invalid details",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                        // }
                      },
                      child: const Text(
                        "Login",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
