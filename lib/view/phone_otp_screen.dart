import 'package:flutter/material.dart';
import 'package:online_learning_app/utils/global_methods.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import 'package:online_learning_app/view/success_verify_screen.dart';
import 'package:online_learning_app/widgets/default_custom_text.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../widgets/elevated_button_widget.dart';

class PhoneOtpScreen extends StatelessWidget {
  const PhoneOtpScreen({
    Key? key,
    required this.phoneNumber,
    required this.email,
    required this.name,
  }) : super(key: key);
  final String phoneNumber;
  final String email;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.s14),
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s50,
            ),
            DefaultCustomText(text: 'Code Is Sent To $phoneNumber'),
            SizedBox(
              height: AppSize.s40,
            ),
            OTPTextField(
              length: 5,
              width: MediaQuery.sizeOf(context).width,
              fieldWidth: 40,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {},
            ),
            SizedBox(
              height: AppSize.s80,
            ),
            DefaultButton(
              text: 'Verify & Create Account',
              width: AppSize.s250,
              function: () {
                GlobalMethods.navigateTo(context, const VerifySuccessScreen());
              },
              context: context,
            )
          ],
        ),
      ),
    );
  }
}
