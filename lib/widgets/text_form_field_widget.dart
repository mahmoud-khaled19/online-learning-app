import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;

  final String? Function(String? val)? validate;
  final IconData? suffixIcon;
  final Function()? suffixFunction;
  final Function()? onTap;
  final Function()? onSubmitted;
  final bool isSecure;
  final TextInputType textType;
  final String? hint;

  const DefaultTextFormField({
    super.key,
    this.hint,
    required this.controller,
    required this.validate,
    this.onTap,
    this.onSubmitted,
    this.suffixIcon,
    this.suffixFunction,
    this.isSecure = false,
    this.textType = TextInputType.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onTap: onTap,
          onEditingComplete: onSubmitted,
          style: Theme.of(context).textTheme.titleSmall,
          obscureText: isSecure,
          keyboardType: textType,
          controller: controller,
          validator: validate,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: suffixFunction,
                child: Icon(
                  suffixIcon,
                )),
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).splashColor),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
