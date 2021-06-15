import 'package:flutter/material.dart';
import 'package:flutterresuables/util/size_config.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class PageIndicator extends StatefulWidget {

  final int length;
  final ValueNotifier<int> pageIndexNotifier;

  const PageIndicator(this.length, this.pageIndexNotifier);

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {

  @override
  Widget build(BuildContext context) {
    return PageViewIndicator(
      indicatorPadding: const EdgeInsets.all(0),
      pageIndexNotifier: widget.pageIndexNotifier,
      length: widget.length,
      normalBuilder: (animationController, index) => Container(
        width: SizeConfig().sw(10).toDouble(),
        height: SizeConfig().sh(10).toDouble(),
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
          width: SizeConfig().sw(20).toDouble(),
          height: SizeConfig().sh(10).toDouble(),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(5.0)
          ),
        ),
      ),
    );
  }
}