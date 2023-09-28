import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/global_methods.dart';
import '../../view/login_screen.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isVisible = true;
  bool isAgreeTerms = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore authStore = FirebaseFirestore.instance;

  void changeVisibility() {
    isVisible = !isVisible;
    emit(ChangeVisibilityState());
  }

  void rememberUserInfo(bool newValue) {
    isAgreeTerms = newValue;
    emit(ChangeKeepSignedUserState());
  }

  Future userRegisterWithEmailAndPassword(
    context, {
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterWithEmailAndPasswordLoadingState());
    await auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      /// addUserDataToFirebase(
      ///   name: name,
      ///   password: password,
      ///   email: email,
      /// );
      GlobalMethods.navigateAndFinish(context, const LoginScreen());
      emit(RegisterWithEmailAndPasswordSuccessState());
    }).catchError((error) {
      emit(RegisterWithEmailAndPasswordErrorState());

      ///  GlobalMethods.showErrorMessage(error, context);
    });
  }
}
