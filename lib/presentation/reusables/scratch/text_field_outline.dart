import 'package:flutter/material.dart';
import 'package:flutterresuables/util/size_config.dart';

class XTextFieldOutline extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Color fillColor;
  final TextInputType keyboardType;
  final Color normalBorderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color hintTextColor;
  final Color normalTextColor;
  final bool autoFocus;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final bool isCollapsed;
  final bool isEnabled;
  final double textSize;

  XTextFieldOutline(
      {@required this.controller,
        @required this.hintText,
        @required this.validator,
        this.textInputAction,
        this.obscureText,
        this.fillColor,
        this.keyboardType,
        this.normalBorderColor,
        this.enabledBorderColor,
        this.focusedBorderColor,
        this.hintTextColor,
        this.normalTextColor,
        this.autoFocus,
        this.suffixIcon,
        this.prefixIcon,
        this.isCollapsed = false,
        this.textSize,
        this.isEnabled});

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig();
    final Color accentColor =  Theme.of(context).accentColor;

    return Container(
        height: sizeConfig.sh(80),
        child: Stack(
          fit: StackFit.loose,
          children: [
            TextFormField(
              enabled: isEnabled,
              autofocus: autoFocus ?? false,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: textSize != null
                      ? sizeConfig.sp(textSize)
                      : sizeConfig.sp(
                    15,
                  ),
                  color: normalTextColor ?? Colors.black,
                  fontWeight: FontWeight.bold),
              obscureText: obscureText ?? false,
              controller: controller,
              validator: validator,
              textInputAction: textInputAction ?? TextInputAction.done,
              keyboardType: keyboardType ?? TextInputType.text,
              decoration: !isCollapsed
                  ? InputDecoration(
//        icon: prefixIcon,
                contentPadding: new EdgeInsets.only(
                    left: prefixIcon != null ? 50 : 20,
                    right: suffixIcon != null ? 50 : 20,
                    top: 15,
                    bottom: 15),
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: textSize != null
                        ? sizeConfig.sp(textSize)
                        : sizeConfig.sp(
                      15,
                    ),
                    color: hintTextColor ?? Colors.grey),
                errorStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(
                    color: Colors.red,
                    fontSize: textSize != null
                        ? sizeConfig.sp(textSize)
                        : sizeConfig.sp(15),
                    fontWeight: FontWeight.bold),
                filled: true,
                fillColor: fillColor != null
                    ? fillColor
                    :Theme.of(context).accentColor.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: normalBorderColor ??
                            accentColor,
                        width: 2.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: enabledBorderColor ??
                            accentColor,
                        width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: focusedBorderColor ??
                            accentColor,
                        width: 2.0)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                    BorderSide(color: Colors.red, width: 2.0)),
              )
                  : InputDecoration.collapsed(
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: textSize != null
                        ? sizeConfig.sp(textSize)
                        : sizeConfig.sp(
                      15,
                    ),
                    color: hintTextColor ?? Colors.grey),
                filled: true,
                fillColor: fillColor != null
                    ? fillColor
                    :Theme.of(context).accentColor.withOpacity(0.2),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              heightFactor: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                child: prefixIcon,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              heightFactor: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 15, top: 15),
                child: suffixIcon,
              ),
            ),
          ],
        ));
  }
}
