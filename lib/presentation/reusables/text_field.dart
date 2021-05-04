import 'package:flutterresuables/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XTextField extends StatelessWidget {
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

  XTextField(
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
                          :Colors.black,
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide(
                              color: normalBorderColor ??
                                  accentColor,
                              width: 2.0)),
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide(
                              color: enabledBorderColor ??
                                  accentColor,
                              width: 2.0)),
                      focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: BorderSide(
                              color: focusedBorderColor ??
                                  accentColor,
                              width: 2.0)),
                      errorBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
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
                          : accentColor,
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

class MkInputField extends StatelessWidget {
  const MkInputField(
      {@required this.controller,
      @required this.label,
      @required this.currentNode,
      this.hint,
      this.nextNode,
      this.isPassword = false,
      this.autoValidate = AutovalidateMode.disabled,
      this.errorText,
      this.onChanged,
      this.validator,
      this.borderColor,
      this.onsaved,
      this.keyboard,
      this.initialValue,
      this.copy = false,
      this.isEnabled = true,
      this.onFieldSubmitted,
      this.textInputAction,
      this.maxLines = 1,
      this.showHint = true,
      this.isForgottenOption = false,
      this.inputFormatters})
      : assert(controller != null);

  final String label;
  final String hint;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final String errorText;
  final bool isPassword;
  final Function(String) onChanged;
  final Function(String) validator;
  final Function(String) onsaved;
  final TextInputType keyboard;
  final bool isEnabled;
  final bool copy;
  final AutovalidateMode autoValidate;
  final String initialValue;
  final TextInputAction textInputAction;
  final dynamic onFieldSubmitted;
  final int maxLines;
  final bool showHint;
  final TextEditingController controller;
  final bool isForgottenOption;
  final List<TextInputFormatter> inputFormatters;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: isEnabled,
      initialValue: initialValue,
      keyboardType: keyboard,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validator,
      focusNode: currentNode,
      inputFormatters: inputFormatters,
      onSaved: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onsaved(value);
      },
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(nextNode);
        onFieldSubmitted(value);
      },
      textInputAction: textInputAction,
      autovalidateMode: autoValidate,
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        labelText: label,
        fillColor: Colors.grey,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        focusColor: Colors.black12.withOpacity(0.05),
        hintStyle:
            TextStyle(color: Colors.black12.withOpacity(0.05), fontSize: 13.0),
      ),
    );
  }
}

class EmailValiditor {
  static String validate(String val) {
    print(val);
    if (!val.contains("@") || !val.contains(".")) {
      return "Enter a valid Email address";
    } else if (val.isEmpty) {
      return "Enter your Email address";
    } else {
      return null;
    }
  }
}
