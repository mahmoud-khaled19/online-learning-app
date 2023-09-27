import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/generated/assets.dart';
import 'package:online_learning_app/utils/global_methods.dart';
import 'package:online_learning_app/utils/style_manager.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import 'package:online_learning_app/widgets/elevated_button_widget.dart';
import 'package:online_learning_app/widgets/text_form_field_widget.dart';
import '../utils/strings_manager.dart';
import '../view_model/register_view_model/register_cubit.dart';
import '../view_model/register_view_model/register_states.dart';
import '../widgets/check_box_widget.dart';
import '../widgets/default_custom_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
        double hSize = MediaQuery.of(context).size.height;
        double wSize = MediaQuery.of(context).size.width;
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s14),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(height: AppSize.s50),
                  DefaultCustomText(
                    text: AppStrings.register,
                    fontWeight: FontWeightManager.bold,
                    fontSize: AppSize.s24,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: AppSize.s10),
                  DefaultCustomText(
                    text: AppStrings.registerScreenMessage,
                    alignment: Alignment.centerLeft,
                    fontSize: AppSize.s10,
                  ),
                  SizedBox(height: AppSize.s40),
                  Image.asset(
                    Assets.imagesSecure,
                    height: hSize * 0.25,
                    fit: BoxFit.cover,
                  ),
                  DefaultTextFormField(
                    controller: cubit.emailController,
                    hint: AppStrings.emailHint,
                    validate: (String? value) {
                      return GlobalMethods.validate(
                          AppStrings.emailValidateMessage, value);
                    },
                  ),
                  DefaultTextFormField(
                    textType: TextInputType.phone,
                    controller: cubit.passwordController,
                    hint: AppStrings.phoneHint,
                    validate: (String? value) {
                      return GlobalMethods.validate(
                          AppStrings.emailValidateMessage, value);
                    },
                  ),
                  DefaultTextFormField(
                    controller: cubit.passwordController,
                    hint: AppStrings.passwordHint,
                    validate: (String? value) {
                      return GlobalMethods.validate(
                          AppStrings.emailValidateMessage, value);
                    },
                    suffixIcon: Icons.visibility_off,
                    isSecure: true,
                  ),
                  SizedBox(height: AppSize.s8),
                  Row(
                    children: [
                      DefaultCheckBoxWidget(
                        value: cubit.isAgreeTerms,
                        onChanged: (newValue) {
                          cubit.rememberUserInfo(newValue!);
                        },
                      ),
                      DefaultCustomText(
                        text: AppStrings.agreeTerms,
                        fontSize: AppSize.s12,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s14),
                  DefaultButton(
                    text: AppStrings.register,
                    function: () {},
                    context: context,
                    width: wSize * 0.7,
                  ),
                  SizedBox(height: AppSize.s30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultCustomText(
                        text: AppStrings.alreadyHaveAccount,
                        fontWeight: FontWeight.normal,
                        fontSize: AppSize.s12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const DefaultCustomText(
                          text: AppStrings.login,
                          fontWeight: FontWeightManager.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
