import 'package:flutterresuables/presentation/reusables/scratch/texts.dart';
import 'package:flutterresuables/util/size_config.dart';
import 'package:flutter/material.dart';

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
              height: config.sh(20),
              width: config.sh(20),
              child: CircularProgressIndicator(
                valueColor: progressColor != null ? AlwaysStoppedAnimation<Color>(progressColor): const AlwaysStoppedAnimation<Color>(Colors.white),),
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

