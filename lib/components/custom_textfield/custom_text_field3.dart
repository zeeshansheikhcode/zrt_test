
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/dimens.dart';
import '../../utils/my_colors.dart';
import '../../utils/size-config/size_config.dart';

class CustomTextField3 extends StatefulWidget {
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

  CustomTextField3(
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
  State<CustomTextField3> createState() => _CustomTextField3State();
}

class _CustomTextField3State extends State<CustomTextField3> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var mediaQuery = MediaQuery.of(context).size;
    SizeConfig().init(context);

    return SizedBox(
      // height: widget.height == null
      //     ? getHeight(Dimens.size40)
      //     : getHeight(widget.height!),
      width: widget.width == null ? mediaQuery.width : getWidth(widget.width!),
      child: TextFormField(
        onTap: widget.onTap,
        autovalidateMode: widget.autovalidateMode == null
            ? AutovalidateMode.onUserInteraction
            : widget.autovalidateMode,
        maxLength: widget.length,
        autofocus: false,
        cursorHeight: 25,
        maxLines: widget.maxlines == null ? 1 : widget.maxlines,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator == null
            ? (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        }
            : widget.validator,
        style: textTheme.bodyMedium!.copyWith(),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        inputFormatters: <TextInputFormatter>[widget.inputFormatters],
        textInputAction: widget.textInputAction == null
            ? TextInputAction.next
            : widget.textInputAction,
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
          fillColor: MyColors.cardColor,
          // border: InputBorder.none,
          errorText: widget.errorText,
          errorStyle: TextStyle(fontSize: 10),
          counterText: "",
         // border: InputBorder.none,

          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5),
            ),
            borderSide: new BorderSide(
              color: Colors.black.withOpacity(.4),
              width: 1.0,
            ),
          ),

          hintText: widget.text,
          hintStyle: TextStyle(
            color:
            widget.hintColor == null ? MyColors.greyFont : widget.hintColor,
            fontWeight: FontWeight.normal,
            fontSize: Dimens.size14,
          ),
          contentPadding: const EdgeInsets.only(left: 8, bottom: 12, right: 8),
          prefixIcon: widget.icon,
          suffixText: widget.suffixtext,
          focusColor: MyColors.green50,
        ),
      ),
    );
  }
}
