import 'package:flutter/material.dart';

class DefaultCheckBoxWidget extends StatelessWidget {
  const DefaultCheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);
  final bool value;
  final  Function(bool? newValue) onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      activeColor: Theme.of(context).primaryColor,
      value: value,
      onChanged: onChanged
    );
  }
}
