import 'package:flutter/material.dart';

import '../utils/values_manager.dart';
import 'default_custom_text.dart';

class DefaultPopMenuWidget extends StatelessWidget {
  const DefaultPopMenuWidget({
    Key? key,
    required this.itemOneFunction,
    required this.itemTwoFunction,
    required this.itemThreeFunction,
    required this.itemOneText,
    required this.itemTwoText,
    required this.itemThreeText,
  }) : super(key: key);
  final Function() itemOneFunction;
  final Function() itemTwoFunction;
  final Function() itemThreeFunction;

  final String itemOneText;
  final String itemTwoText;
  final String itemThreeText;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.arrow_forward_ios_outlined),
      padding: EdgeInsets.only(left: AppSize.s20),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 0,
          child: GestureDetector(
            onTap: itemOneFunction,
            child: DefaultCustomText(
              text: itemOneText,
              color: Theme.of(context).splashColor,
              alignment: Alignment.center,
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: GestureDetector(
            onTap: itemTwoFunction,
            child: DefaultCustomText(
              text: itemTwoText,
              color: Theme.of(context).splashColor,
              alignment: Alignment.center,
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: GestureDetector(
            onTap: itemThreeFunction,
            child: DefaultCustomText(
              text: itemThreeText,
              color: Theme.of(context).splashColor,
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }
}
