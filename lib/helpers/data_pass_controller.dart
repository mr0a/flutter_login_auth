import 'package:flutter/material.dart';

class MyController {
  static final TextEditingController dataController = TextEditingController();
  static final TextEditingController passController = TextEditingController();

  static String get username => dataController.text;
  static String get password => passController.text;

  static void displayDialog(BuildContext context, String title, String text) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: CircularProgressIndicator(
            backgroundColor: Colors.amber,
          ),
        ),
      );
}
