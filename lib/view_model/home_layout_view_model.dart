import 'package:flutter/material.dart';
import 'package:online_learning_app/view/home_screens/account_screen.dart';
import 'package:online_learning_app/view/home_screens/courses_screen.dart';
import 'package:online_learning_app/view/home_screens/home_screen.dart';
import 'package:online_learning_app/view/home_screens/message_screen.dart';
import '../utils/strings_manager.dart';

class HomeLayoutViewModel {
  static List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.home),
    BottomNavigationBarItem(
        icon: Icon(Icons.bookmark), label: AppStrings.course),
    BottomNavigationBarItem(icon: Icon(Icons.message), label: AppStrings.chat),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), label: AppStrings.account),
  ];
  static List<String> screensTitles = const [
    AppStrings.home,
    '2',
    '3',
    '4',
  ];
  static int bottomNavigationBarIndex = 0;

  static List<Widget> screensBody = const [
   HomeScreen(),
   CoursesScreen(),
   MessageScreen(),
   AccountScreen(),
  ];
}
