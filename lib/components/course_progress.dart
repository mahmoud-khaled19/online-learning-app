import 'package:flutter/material.dart';
import 'package:online_learning_app/utils/style_manager.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import 'package:online_learning_app/widgets/default_custom_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CourseProgress extends StatelessWidget {
  const CourseProgress({
    Key? key,
    required this.courseName,
    required this.courseProgress,
    required this.courseTime,
    required this.progressPercent,
  }) : super(key: key);
  final String courseName;
  final String courseProgress;
  final String courseTime;
  final double progressPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      height: AppSize.s80,
      padding: EdgeInsets.symmetric(horizontal: AppSize.s10),
      margin: EdgeInsets.only(top: AppSize.s8),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: CircularPercentIndicator(
              animation: true,
              addAutomaticKeepAlive: true,
              radius: 15.0,
              lineWidth: 4.0,
              percent: progressPercent,
              backgroundColor: Colors.grey.shade300,
              progressColor: Colors.green,
            ),
          ),
          DefaultCustomText(
            text: courseName,
            fontWeight: FontWeightManager.bold,
          ),
          const Spacer(),
          DefaultCustomText(
            text: courseProgress.toString(),
            fontWeight: FontWeightManager.bold,
            fontSize: AppSize.s16,
          ),
          DefaultCustomText(
            text: '/$courseTime',
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
