import 'package:flutter/material.dart';
import 'package:stepp_app/constants/widgets/custom_text_field_size.dart';
import 'package:stepp_app/utils/build_context_helper.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.leadingIcon,
    this.hintText,
  });

  final TextEditingController controller;
  final Widget? leadingIcon;
  final String? hintText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.white,
      style: context.textTheme.bodyLarge!.copyWith(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        hintText: widget.hintText,
        hintStyle: context.textTheme.bodyLarge!.copyWith(
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
