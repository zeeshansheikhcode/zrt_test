import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/dimens.dart';
import '../../utils/my_colors.dart';
import '../../utils/size-config/size_config.dart';

class CustomTextField2 extends StatefulWidget {
  final double? height;
  final double? width;
  final String text;
  final int length;
  final TextInputType keyboardType;
  final TextInputFormatter inputFormatters;
  bool? Readonly = false;
  final Icon? icon;
  final Icon? leading;
  final InputBorder? border;
  final String? errorText;
  final FocusNode? focusNode;
  final String? suffixtext;
  final int? sufficon;
  final Color? hintColor;
  final int? maxlines;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final Function()? onEditingComplete;

  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  bool? obscureText;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;

  CustomTextField2(
      {Key? key,
        this.height,
        this.width,
        this.leading,
        this.controller,
        this.border,
        this.maxlines,
        required this.text,
        this.validator,
        this.sufficon,
        this.onChanged,
        this.errorText,
        this.Readonly,
        this.focusNode,
        this.hintColor,
        this.icon,
        this.obscureText,
        this.suffixtext,
        this.onTap,
        required this.length,
        required this.keyboardType,
        required this.inputFormatters,
        this.autovalidateMode,
        this.onEditingComplete,
        this.onFieldSubmitted,
        this.textInputAction})
      : super(key: key);

  @override
  State<CustomTextField2> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField2> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var mediaQuery = MediaQuery.of(context).size;
    SizeConfig().init(context);

    return SizedBox(
      height: widget.height == null
          ? getHeight(Dimens.size40)
          : getHeight(widget.height!),
      width: widget.width == null ? mediaQuery.width : getWidth(widget.width!),
      child: TextFormField(
        onTap: widget.onTap,
        autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
        maxLength: widget.length,
        autofocus: false,
        cursorHeight: 25,
        cursorColor: Colors.white,

        maxLines: widget.maxlines ?? 1,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator ?? (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        style: textTheme.bodyMedium!.copyWith(),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        inputFormatters: <TextInputFormatter>[widget.inputFormatters],
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        readOnly: widget.Readonly == true ? true : false,
        obscureText: widget.obscureText == true ? true : false,
        decoration: InputDecoration(

          suffixIcon: (widget.sufficon != null)
              ? GestureDetector(
              onTap: () {
                setState(() {
                  widget.obscureText = !widget.obscureText!;
                });
              },
              child: Icon(
                widget.obscureText!
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: Dimens.size20,
              ))
              : null,
          filled: true,
          fillColor: Color(0xff2C2C2E),
          //border: InputBorder.none,
          errorText: widget.errorText,
          errorStyle: TextStyle(fontSize: 0),
          counterText: "",
          //border: InputBorder.none,

          // border: new OutlineInputBorder(
          //   borderRadius: const BorderRadius.all(
          //     const Radius.circular(5),
          //   ),
          //   borderSide: new BorderSide(
          //     color: Colors.black,
          //     width: 1.0,
          //   ),
          // ),

          hintText: widget.text,
          hintStyle: TextStyle(
            color:
            widget.hintColor ?? MyColors.greyFont,
            fontWeight: FontWeight.normal,
            fontSize: Dimens.size14,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          prefixIcon: widget.icon,
          suffixText: widget.suffixtext,
          focusColor: MyColors.green50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 1.0,
              color: Color(0xff2C2C2E),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 1.0,
              color: Color(0xff2C2C2E),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 1.0,
              color: Color(0xff2C2C2E),
            ),),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 1.0,
                color: Color(0xff2C2C2E),

            ),
          ),
        ),
      ),
    );
  }
}
