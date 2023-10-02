import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LinearPercentIndicator(
        width: 140.0,
        lineHeight: 14.0,
        percent: 0.5,
        backgroundColor: Colors.grey,
        progressColor: Colors.blue,
      ),
    );
  }
}
