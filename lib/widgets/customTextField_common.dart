import 'package:alissons_app/utils/theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool? readOnly;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.icon,
    this.onChanged,
    this.validator,
    this.controller,
    this.keyboardType,
    this.readOnly,
    this.suffixIcon,
    this.isObscureText,
    this.inputFormatters,
    this.maxLength,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return TextFormField(
      maxLines: isObscureText == true ? 1 : maxLines,
      readOnly: readOnly ?? false,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: isObscureText ?? false,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      style: TextStyle(
        fontFamily: 'Urbanist',
        fontSize: w * 0.037,
        color: Palette.blackColor,
      ),
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        hintText: labelText,
        hintStyle: TextStyle(
          fontFamily: 'Urbanist',
          fontSize: w * 0.036,
          color: Palette.blackColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: w * 0.01),
        ),
        suffixIcon: suffixIcon,
enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 1.5),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    fillColor: Color(0xFFF2F2F2)
      ),
    );
  }
}