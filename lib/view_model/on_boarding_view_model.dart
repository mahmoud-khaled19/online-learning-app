import 'package:flutter/material.dart';
import 'package:online_learning_app/generated/assets.dart';
import '../model/boarding_list_model.dart';

abstract class OnBoardingViewModel {
  static var boardingController = PageController();
  static bool isLast = false;
  static List<BoardingList> boardingList = [
    BoardingList(
      'Udemy free courses',
      'Free courses for you to',
      'find your way to learning',
      Assets.imagesBoard1,
    ),
    BoardingList(
      'Quick and easy learning',
      'Easy and fast learning at any time',
      ' to help you improve various skills',
      Assets.imagesBoard2,
    ),
    BoardingList(
      'Create your own study plan',
      'Study according to the study plan,',
      ' make study more motivated',
      Assets.imagesBoard3,
    ),
  ];
  static late AnimationController animationController;
  static late Animation<TextStyle> animation;
  static late Animation<double> animationButton;
}
