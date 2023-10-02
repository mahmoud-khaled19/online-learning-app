import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/utils/strings_manager.dart';
import 'package:online_learning_app/utils/theme_manager.dart';
import 'package:online_learning_app/view/on_boarding_screen.dart';
import 'package:online_learning_app/view_model/home_screen_view_model/home_screen_cubit.dart';
import 'package:online_learning_app/view_model/login_view_model/login_cubit.dart';
import 'package:online_learning_app/view_model/register_view_model/register_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit()),
        BlocProvider<HomeScreenCubit>(
            create: (BuildContext context) => HomeScreenCubit()),
        BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: getLightApplicationTheme(),
        home: const OnBoardingView(),
      ),
    );
  }
}
