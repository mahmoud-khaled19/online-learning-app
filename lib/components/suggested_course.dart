import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import 'package:online_learning_app/view_model/home_screen_view_model/home_screen_cubit.dart';
import 'package:online_learning_app/view_model/home_screen_view_model/home_screen_state.dart';
import 'package:online_learning_app/widgets/default_custom_text.dart';

class SuggestedCourse extends StatelessWidget {
  const SuggestedCourse({
    Key? key,
    required this.containerHeight,
  }) : super(key: key);
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    double hSize = MediaQuery.sizeOf(context).height;
    double wSize = MediaQuery.sizeOf(context).width;

    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
      builder: (context, state) {
        HomeScreenCubit homeScreenCubit = BlocProvider.of(context);
        return CarouselSlider(
          options: CarouselOptions(
            height: containerHeight,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(seconds: 4),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: hSize * 0.14),
                      decoration: BoxDecoration(
                          color: homeScreenCubit.coursesBackGroundColors[i - 1],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        homeScreenCubit.coursesImages[i - 1],
                        height: hSize * 0.38,
                        width: wSize * 0.55,
                      ),
                    ),
                    Container(
                      height: AppSize.s40,
                      width: homeScreenCubit.coursesNameList[i - 1].length * 10,
                      padding: EdgeInsets.all(AppSize.s4),
                      margin: EdgeInsets.only(
                          bottom: AppSize.s10, right: AppSize.s10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: DefaultCustomText(
                        fontSize: AppSize.s12,
                        text: homeScreenCubit.coursesNameList[i - 1],
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
