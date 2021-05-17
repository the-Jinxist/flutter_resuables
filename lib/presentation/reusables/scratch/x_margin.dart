import 'package:flutterresuables/util/size_config.dart';
import 'package:flutter/material.dart';

class XMargin extends StatelessWidget {



  final double width;

  XMargin(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig().sw(width),
    );
  }
}
