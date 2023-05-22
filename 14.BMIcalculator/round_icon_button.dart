import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {

  final Widget? child;
  final Function? onPressed;
  final int? heroTag;
  RoundIconButton({this.child, this.onPressed, this.heroTag});


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: () {
        onPressed?.call();
      },
      child: child,
      backgroundColor: Color(0xFF4C4F5E),
    );
  }
}
