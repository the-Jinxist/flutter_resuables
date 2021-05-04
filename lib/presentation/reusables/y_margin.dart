import 'package:flutterresuables/util/size_config.dart';
import 'package:flutter/material.dart';

class YMargin extends StatelessWidget {

  final double height;

  YMargin(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig().sh(height),
    );
  }
}
