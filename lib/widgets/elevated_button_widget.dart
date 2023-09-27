import 'package:flutter/material.dart';
import 'package:online_learning_app/utils/values_manager.dart';
import '../utils/style_manager.dart';
import 'default_custom_text.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.function,
    required this.context,
    this.width,
    this.color,
  }) : super(key: key);
  final Function() function;
  final String text;
  final double? width;
  final Color? color;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? AppSize.s150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? Theme.of(context).splashColor,
      ),
      child: TextButton(
        onPressed: function,
        child: DefaultCustomText(
          alignment: Alignment.center,
          text: text,
          fontWeight: FontWeightManager.bold,
        ),
      ),
    );
  }
}
