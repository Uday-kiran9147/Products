import 'package:amazonn/features/Auth/Screens/auth_screen.dart';
import 'package:amazonn/router.dart';
import 'package:flutter/material.dart';

import 'constants/global_vars.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black), elevation: 5),
            scaffoldBackgroundColor: GlobalVariables.backgroundColor),
        title: "Amazon",
        onGenerateRoute: (settings) => generateRoute(settings),
        home: AuthScreen());
  }
}
