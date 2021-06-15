import 'package:flutterresuables/util/size_config.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;
  final TextDecoration decoration;

  const TitleText({@required this.text, this.fontSize, this.fontWeight, this.textColor, this.textAlign, this.maxLines, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      style: Theme.of(context).textTheme.headline1
          .copyWith(
            decoration: decoration,
            fontSize: fontSize != null ? SizeConfig().sp(fontSize): 17,
            fontWeight: fontWeight ?? FontWeight.bold,
            color: textColor ?? Colors.black
          ),
    );
  }
}

class SubTitleText extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration decoration;

  const SubTitleText({@required this.text, this.fontSize, this.fontWeight, this.textColor, this.textAlign, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: textAlign ?? TextAlign.start,
      style: Theme.of(context).textTheme.headline2
          .copyWith(
          decoration: decoration,
          letterSpacing: SizeConfig().sw(.3),
          fontSize: fontSize != null ? SizeConfig().sp(fontSize): 15,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? Colors.black
      ),
    );
  }
}

class NormalText extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;
  final TextDecoration decoration;

  const NormalText({@required this.text, this.fontSize, this.textColor, this.fontWeight, this.textAlign, this.maxLines, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      style: Theme.of(context).textTheme.bodyText1
          .copyWith(
          letterSpacing: SizeConfig().sw(.8),
          height: SizeConfig().sh(1.2),
          decoration: decoration,
          fontSize: fontSize != null ? SizeConfig().sp(fontSize): 14,
          color: textColor ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.normal
      ),
    );
  }
}

class AccentText extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color textColor;
  final TextAlign textAlign;
  final TextDecoration decoration;

  const AccentText({@required this.text, this.fontSize, this.textColor, this.textAlign, this.decoration});

  @override
  Widget build(BuildContext context) {

    return Text(text,
      textAlign: textAlign ?? TextAlign.start,
      style: Theme.of(context).textTheme.bodyText1
          .copyWith(
          decoration: decoration,
          fontSize: fontSize != null ? SizeConfig().sp(fontSize): 14,
          color: textColor ?? Colors.black
      ),
    );
  }
}

class MkText extends StatelessWidget {
  const MkText(
      this.text, {
        Key key,
        this.textAlign,
        this.style,
        this.maxLines,
        this.overflow = TextOverflow.ellipsis,
      })  : assert(text != null),
        super(key: key);

  final String text;
  final TextAlign textAlign;
  final TextStyle style;
  final int maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    final SizeConfig config = SizeConfig();

    return Text(
      text,
      maxLines: maxLines,
      overflow: maxLines != null ? overflow : null,
      textAlign: textAlign,
      style: style?.copyWith(
        fontSize: config.sp(
          style.fontSize ?? 14,
        ),
      ),
    );
  }
}

