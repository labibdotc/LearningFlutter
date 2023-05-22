import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String text;
  IconContent({this.icon, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(this.icon, size:iconSize),
      SizedBox(height: spacing),
      Text(this.text, style: labelTextStyle)
    ]);
  }
}