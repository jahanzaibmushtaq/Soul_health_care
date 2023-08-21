import 'package:flutter/material.dart';
class GenderButtonWidget extends StatelessWidget {
  const GenderButtonWidget(
      {super.key,  this.icons, required this.name});
  final Icon? icons;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icons??Container(),
        Text(name),
      ],
    );
  }
}
