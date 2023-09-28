import 'package:flutter/material.dart';
import 'package:online_learning_app/utils/style_manager.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import 'package:online_learning_app/widgets/default_custom_text.dart';
import 'package:online_learning_app/widgets/elevated_button_widget.dart';

class VerifySuccessScreen extends StatelessWidget {
  const VerifySuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hSize = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        child: Container(
          height: hSize * 0.35,
          padding: EdgeInsets.all(AppSize.s10),
          margin: EdgeInsets.all(AppSize.s40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(Icons.check),
            ),
            SizedBox(height: AppSize.s20),
            const DefaultCustomText(
              text: 'Success',
              fontWeight: FontWeightManager.bold,
            ),
            SizedBox(height: AppSize.s20),
            DefaultCustomText(
              text: 'Congratulations, you have',
              color: Theme.of(context).textTheme.titleSmall?.color,
            ),
            DefaultCustomText(
              text: 'completed your registration!',
              color: Theme.of(context).textTheme.titleSmall?.color,
            ),
            SizedBox(height: AppSize.s20),
            DefaultButton(
              text: 'Done',
              function: () {},
              context: context,
              width: AppSize.s250,
            )
          ]),
        ),
      ),
    );
  }
}
