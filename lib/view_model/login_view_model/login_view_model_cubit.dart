import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_view_model_state.dart';

class LoginCubit extends Cubit<LoginStateS> {
  LoginCubit() : super(LoginInitialState());
  LoginCubit get(context)=> BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

}
