import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_learning_app/generated/assets.dart';
import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  HomeScreenCubit get(context) => BlocProvider.of(context);

  List<String> coursesNameList = const [
    'Programming',
    'Web Design',
    'Web Development',
    'Mobile Development',
    'Android'
  ];
  List<String> coursesImages =const [
    Assets.imagesBoard1,
    Assets.imagesBoard2,
    Assets.imagesBoard3,
    Assets.imagesBoard1,
    Assets.imagesBoard2,
  ];
  List<Color> coursesBackGroundColors = [
    HexColor('EAEAFF'),
    HexColor('CEECFE'),
    HexColor('EFE0FF'),
    HexColor('EAEAFF'),
    HexColor('CEECFE'),
  ];
}
