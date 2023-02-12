import 'package:amazonn/common/custom_button.dart';
import 'package:amazonn/common/customtextfield.dart';
import 'package:amazonn/constants/global_vars.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  // const AuthScreen({super.key});
  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;

  @override
  Widget build(BuildContext context) {
    // Navigator.pushNamed(context, ' ',)
    final _signUpformkey = GlobalKey<FormState>();
    final _signInformkey = GlobalKey<FormState>();

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();

    void dispose() {
      super.dispose();
      _emailController.dispose();
      _passwordController.dispose();
      _nameController.dispose();
    }

    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Helloe",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpformkey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _nameController,
                          hintText: "Username",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                            controller: _emailController, hintText: "Email"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CostumButton(text: "Sign-Up", onTap: () {})
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Sign-In",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpformkey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                            controller: _emailController, hintText: "Email"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CostumButton(text: "Sign-In", onTap: () {})
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
