import 'package:flutter/material.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import 'package:online_learning_app/widgets/default_custom_text.dart';

class VerifySuccessScreen extends StatelessWidget {
  const VerifySuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hSize = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: hSize * 0.4,
        padding: EdgeInsets.all(AppSize.s10),
        margin: EdgeInsets.all(AppSize.s20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor),
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.check),
              ),
              SizedBox(height: AppSize.s16),
              const DefaultCustomText(text: 'Success'),
              SizedBox(height: AppSize.s8),
              const DefaultCustomText(text: 'Congratulations, you have '),
              const DefaultCustomText(text: 'completed your registration!'),

            ]),
      ),
    );
  }
}
