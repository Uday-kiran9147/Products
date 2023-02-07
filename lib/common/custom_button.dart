// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CostumButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity,
                50 /* infinity , 50 are width and height respectively */)),
        onPressed: onTap,
        child: Text(text));
  }
}
