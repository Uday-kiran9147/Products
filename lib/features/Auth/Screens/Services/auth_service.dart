import 'package:amazonn/Models/user.dart';
import 'package:amazonn/constants/error_handle.dart';
import 'package:amazonn/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/global_vars.dart';

class AuthService {
  //signup
  void signupUser(
      {required BuildContext context,
      required email,
      required password,
      required name}) async {
    try {
      User user = User(
          id: "",
          name: "",
          email: "",
          password: "",
          address: "",
          type: "",
          token: "");

      http.Response res = await http.post(
        Uri.parse("$uri/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'appllication/json; charset=UTF-8',
        },
      );
      print(res.statusCode);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            ShowSnackBar(context, "Account has been created successfully");
          });
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }
}
