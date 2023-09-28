import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/generated/assets.dart';
import 'package:online_learning_app/utils/global_methods.dart';
import 'package:online_learning_app/utils/style_manager.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import 'package:online_learning_app/view/sign_up_screen.dart';
import 'package:online_learning_app/view_model/login_view_model/login_view_model_cubit.dart';
import 'package:online_learning_app/view_model/login_view_model/login_view_model_state.dart';
import 'package:online_learning_app/widgets/elevated_button_widget.dart';
import 'package:online_learning_app/widgets/text_form_field_widget.dart';
import '../utils/strings_manager.dart';
import '../widgets/default_custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
        double hSize = MediaQuery.of(context).size.height;
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s14),
              child: ListView(
                children: [
                  SizedBox(height: AppSize.s50),
                  DefaultCustomText(
                    text: AppStrings.login,
                    fontWeight: FontWeightManager.bold,
                    fontSize: AppSize.s24,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: AppSize.s8),
                  DefaultCustomText(
                    text: AppStrings.loginScreenMessage,
                    fontSize: AppSize.s10,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: AppSize.s10),
                  Image.asset(
                    Assets.imagesLogin,
                    height: hSize * 0.2,
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
                    keyboardAction: TextInputAction.done,
                    controller: cubit.passwordController,
                    hint: AppStrings.passwordHint,
                    validate: (String? value) {
                      return GlobalMethods.validate(
                          AppStrings.passwordValidateMessage, value);
                    },
                    suffixFunction: () {
                      cubit.changeVisibility();
                    },
                    suffixIcon:cubit.isVisible? Icons.visibility_off:Icons.visibility ,
                    isSecure: cubit.isVisible,
                  ),
                  SizedBox(height: AppSize.s10),
                  DefaultCustomText(
                    text: AppStrings.forgetPassword,
                    fontSize: AppSize.s12,
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: AppSize.s24),
                  DefaultButton(
                    text: AppStrings.login,
                    function: () {},
                    context: context,
                  ),
                  SizedBox(height: AppSize.s40),
                  DefaultCustomText(
                    text: AppStrings.or,
                    fontSize: AppSize.s14,
                  ),
                  SizedBox(height: AppSize.s20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        // visible: state is ! SignInWithGoogleLoadingState ||
                        //     state is SignInWithGoogleErrorState,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            ///   cubit.signInWithGoogle(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: Image.asset(
                              Assets.imagesGmail,
                              height: AppSize.s40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppSize.s20,
                      ),
                      GestureDetector(
                          onTap: () {
                            GlobalMethods.navigateAndFinish(
                                context, const RegisterScreen());
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: Icon(
                              Icons.email,
                              size: AppSize.s40,
                              color: Colors.blue,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
