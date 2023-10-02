import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/view/login_screen.dart';
import '../../utils/global_methods.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore authStore = FirebaseFirestore.instance;

  void changeVisibility() {
    isVisible = !isVisible;
    emit(ChangeVisibilityState());
  }

  Future userLoginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(SignInWithEmailAndPasswordLoadingState());
    await auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      /// GlobalMethods.navigateAndFinish(context, const LayoutScreen());
      emit(SignInWithEmailAndPasswordSuccessState());
    }).catchError((error) {
      emit(SignInWithEmailAndPasswordErrorState());

      /// GlobalMethods.showErrorMessage(error, context);
    });
  }

  Future resetPassword(String email, context) async {
    emit(ResetPasswordLoadingPassword());
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      emit(ResetPasswordSuccessPassword());
      GlobalMethods.showSnackBar(
          context, 'Email Send Successfully', Colors.green);
    }).catchError((error) {
      GlobalMethods.showSnackBar(context, 'write a valid Email', Colors.red);
    });
  }

  Future signOut(context) async {
    auth.signOut().then((value) {
      GlobalMethods.navigateAndFinish(context, const LoginScreen());
    });
    emit(SignOutSuccessState());
  }
}
