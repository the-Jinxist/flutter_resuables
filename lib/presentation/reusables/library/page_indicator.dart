import 'package:flutter/material.dart';
import 'package:flutterresuables/util/size_config.dart';

class PageIndicator extends StatefulWidget {

  final int length;
  final ValueNotifier<int> pageIndexNotifier;

  PageIndicator(this.length, this.pageIndexNotifier);

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return PageViewIndicator(
      indicatorPadding: EdgeInsets.all(0),
      pageIndexNotifier: widget.pageIndexNotifier,
      length: widget.length,
      normalBuilder: (animationController, index) => Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(5.0)
        ),
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Container(
          width: SizeConfig().sw(20),
          height: SizeConfig().sh(10),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(5.0)
          ),
        ),
      ),
    );
  }
}