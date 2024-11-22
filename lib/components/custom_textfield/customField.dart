import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyBoardType;
  final dynamic hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final double height;
  final double width;
  final double borderRadius;
  final Color textColor;
  final TextStyle hintStyle;
  final IconData? suffixIcon;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final Color borderColor;
  final TextStyle? errorStyle;
  final Color filledColor;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;
  final int? maxLength;
  CustomTextField({super.key, 
    this.keyBoardType,
    this.errorStyle,
    this.suffixIcon,
    this.validator,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.height = 52,
    this.width = double.infinity,
    this.borderRadius = 20.0,
    this.borderColor = const Color(0xffDDDDDD),
    this.textColor = Colors.white,
    this.filledColor = const Color(0xff2C2C2E),
    this.onChanged,
    this.errorText,
    this.inputFormatters,
    this.maxLength,
    TextStyle? hintStyle,
  }) : hintStyle = hintStyle ?? const TextStyle(color: Colors.grey);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        maxLength: widget.maxLength ?? 50,
        scrollPadding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        onTapOutside: (e) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: widget.onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        obscureText: widget.obscureText && !isPasswordVisible,
        keyboardType: widget.keyBoardType,
        inputFormatters: widget.inputFormatters,
        style: TextStyle(color: widget.textColor,fontSize: 18),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          fillColor: widget.filledColor,
          filled: true,
          hintText: widget.hintText,
          counterText: "",
          hintStyle: widget.hintStyle,
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              width: 1.0,
              color: widget.borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              width: 1.0,
              color: widget.borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              width: 1.0,
              color: widget.borderColor,
            ),
          ),
        ),
      ),
    );
  }
}
