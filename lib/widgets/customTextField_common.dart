import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool? isObscureText;
  final String? labelText;
  final Widget? suffixIcon;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.isObscureText,
    this.validator,
    this.controller,
    this.labelText,
    this.suffixIcon,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: isObscureText ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.surfaceColor, width: w * 0.01),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.surfaceColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),

        fillColor: Palette.surfaceColor,
        suffixIcon: suffixIcon,
        filled: true,
      ),
    );
  }
}
