import 'package:flutter/material.dart';
import 'constants.dart';
class ReusableCard extends StatelessWidget {
  final Color? color;
  final Widget? cardChild;
  final Function? function;
  ReusableCard({this.color, this.cardChild, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function?.call();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}