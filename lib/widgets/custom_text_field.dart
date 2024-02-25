import 'package:flutter/material.dart';
import 'package:stepp_app/constants/widgets/custom_text_field_size.dart';
import 'package:stepp_app/utils/build_context_helper.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.leadingIcon,
    this.hintText,
    this.maxLine,
    this.backgroundColor,
    this.hintTextStyle,
  });

  final TextEditingController controller;
  final Widget? leadingIcon;
  final String? hintText;
  final int? maxLine;
  final Color? backgroundColor;
  final TextStyle? hintTextStyle;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextStyle? _buildHintTextStyle() => widget.hintTextStyle ?? context.textTheme.bodyLarge;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.white,
      style: context.textTheme.bodyLarge!.copyWith(
        color: Colors.white,
      ),
      maxLines: widget.maxLine,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.backgroundColor ?? Colors.black,
        hintText: widget.hintText,
        hintStyle: _buildHintTextStyle()!.copyWith(
          color: Colors.white,
        ),
        prefixIcon: widget.leadingIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            CustomTextFieldSize.borderRadius,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            CustomTextFieldSize.borderRadius,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            CustomTextFieldSize.borderRadius,
          ),
        ),
      ),
    );
  }
}
