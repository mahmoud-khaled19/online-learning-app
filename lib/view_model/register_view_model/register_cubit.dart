import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  bool isAgreeTerms = false;

  void changeVisibility() {
    isVisible = !isVisible;

    /// emit(ChangeVisibilityState());
  }

  void rememberUserInfo(bool newValue) {
    isAgreeTerms = newValue;
    emit(ChangeKeepSignedUserState());
  }
}
