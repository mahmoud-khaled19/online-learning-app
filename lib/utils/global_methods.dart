import 'package:flutter/material.dart';

import '../widgets/default_custom_text.dart';


class GlobalMethods {
  static navigateTo(context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static navigateAndFinish(context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }

  static showSnackBar(BuildContext context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: color,
      content: DefaultCustomText(
        text: text,
      ),
    ));
  }

  static validate(text, String? value) {
    if (value!.isEmpty || value.length < 6) {
      return text;
    } else {
      return null;
    }
  }
}
