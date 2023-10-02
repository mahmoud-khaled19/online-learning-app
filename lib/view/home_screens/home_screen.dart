import 'package:flutter/material.dart';
import 'package:online_learning_app/generated/assets.dart';
import 'package:online_learning_app/utils/colors_manager.dart';
import 'package:online_learning_app/utils/style_manager.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import 'package:online_learning_app/widgets/default_custom_text.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../components/course_progress.dart';
import '../../components/suggested_course.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hSize = MediaQuery.sizeOf(context).height;
    double wSize = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(AppSize.s14),
                color: ColorsManager.lightSecondColor,
                height: hSize * 0.2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultCustomText(
                          text: 'Hi, Koota',
                          color: Colors.white,
                          fontSize: AppSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: AppSize.s8,
                        ),
                        const DefaultCustomText(
                          text: 'Let\'s start learning',
                          color: Colors.white,
                          fontWeight: FontWeightManager.regular,
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset(Assets.imagesProfilePic),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppSize.s14),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      SuggestedCourse(
                        containerHeight: hSize * 0.4,
                      ),
                      SizedBox(
                        height: AppSize.s14,
                      ),
                      DefaultCustomText(
                        text: 'Learning Plan',
                        alignment: Alignment.centerLeft,
                        fontWeight: FontWeightManager.bold,
                        fontSize: AppSize.s18,
                      ),
                      const CourseProgress(
                        courseName: 'Flutter Advanced Course',
                        courseProgress: '40',
                        courseTime: '46',
                        progressPercent: 0.86,
                      ),
                      const CourseProgress(
                        courseName: 'Flutter Online Learning App',
                        courseProgress: '6',
                        courseTime: '24',
                        progressPercent: 0.25,
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 120,
            right: 12,
            left: 12,
            child: Container(
              padding: EdgeInsets.all(AppSize.s14),
              height: hSize * 0.16,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      const DefaultCustomText(
                        text: 'Learned today',
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: DefaultCustomText(
                            text: 'My Courses',
                            color: Theme.of(context).splashColor,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      DefaultCustomText(
                        text: '46min',
                        fontWeight: FontWeightManager.bold,
                        fontSize: AppSize.s20,
                      ),
                      const DefaultCustomText(
                        text: '/72min',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s12,
                  ),
                  LinearPercentIndicator(
                    width: wSize * 0.66,
                    lineHeight: 8,
                    percent: 0.77,
                    backgroundColor: Colors.grey,
                    progressColor: Color.lerp(
                      Colors.grey,
                      Colors.deepOrange,
                      0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
