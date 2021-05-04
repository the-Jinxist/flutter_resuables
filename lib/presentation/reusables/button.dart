import 'package:flutterresuables/presentation/reusables/texts.dart';
import 'package:flutterresuables/util/size_config.dart';
import 'package:flutter/material.dart';

class MkButton extends StatelessWidget {
  const MkButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.height,
    this.width,
    this.borderColor = Colors.transparent,
    this.fontWeight = FontWeight.w500,
    this.color = Colors.white,
    this.textColor = Colors.white,
    this.isFlat = false,
    this.fontSize = 16.0,
  })  : assert(
  text != null && onPressed != null && height != null && height > 0),
        super(key: key);

  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final bool isFlat;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    final SizeConfig config = SizeConfig();

    return Container(
      height: config.sh(height),
      width: width != null ? config.sw(width) : null,
      child: FlatButton(
        onPressed: onPressed,
        color: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isFlat ? 4.0 : 20.0),
          side: BorderSide(
            color: isFlat
                ? Colors.transparent
                : borderColor ?? Theme.of(context).accentColor,
          ),
        ),
        child: MkText(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class MkOutlinedButton extends StatelessWidget {
  const MkOutlinedButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.height,
    this.width,
    this.borderColor,
    this.fontWeight = FontWeight.w500,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.isFlat = false,
    this.fontSize = 14.0,
  })  : assert(
  text != null && onPressed != null && height != null && height > 0),
        super(key: key);

  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final bool isFlat;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    final SizeConfig config = SizeConfig();

    return Container(
      height: config.sh(height),
      width: width != null ? config.sw(width) : null,
      child: OutlineButton(
        onPressed: onPressed,
        color: borderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isFlat ? 4.0 : 20.0),
          side: BorderSide(
            color: borderColor ,
          ),
        ),
        child: MkText(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class XButton extends StatelessWidget {

  final double height;
  final double width;
  final Function onClick;
  final String text;
  final double radius;
  final Color buttonColor;
  final Color textColor;
  final bool isLoading;
  final Color progressColor;
  final double textSize;
  final bool isOutlined;
  final Color borderColor;

  XButton({
    @required this.onClick,
    @required this.text,
    this.height,
    this.width,
    this.radius,
    this.buttonColor,
    this.textColor,
    this.isLoading,
    this.progressColor,
    this.textSize,
    this.isOutlined = false,
    this.borderColor
  });

  final SizeConfig config = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClick();

      },
      child: Container(
        height: height != null ? config.sh(height) : config.sh(40),
        width: width != null ? config.sw(width) : config.sw(100),
        decoration: BoxDecoration(
            color: buttonColor ?? Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(5.0),
            border: isOutlined ? Border.all(color: borderColor ?? Theme.of(context).accentColor, width: config.sh(1)): null
        ),
        child: Center(
            child:
            isLoading == null ?
            NormalText(
              text: text,
              textColor: textColor ?? Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: textSize == null ? config.sp(16): config.sp(textSize),
            ): !isLoading ?
            NormalText(
              text: text,
              fontWeight: FontWeight.w700,
              textColor: textColor ?? Colors.white,
              fontSize: textSize == null ? config.sp(16): config.sp(textSize),
            ): isLoading ?
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                valueColor: progressColor != null ? AlwaysStoppedAnimation<Color>(progressColor): AlwaysStoppedAnimation<Color>(Colors.white),),
              height: config.sh(20),
              width: config.sh(20),
            ) :
            NormalText(
              text: text,
              fontWeight: FontWeight.w700,
              textColor: textColor ?? Colors.white,
              fontSize: textSize == null ? config.sp(16): config.sp(textSize),
            )
        ),
      ),
    );
  }
}

