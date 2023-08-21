import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.function,
      required this.buttonText,
      required this.buttonColor,
      required this.icon,
      required this.textColor});
  final Function function;
  final String buttonText;
  final String icon;
  final Color buttonColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => function.call(),
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          fixedSize: Size(Get.width - 30, 60),
          elevation: 10,
          shape: const StadiumBorder()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 30,
            width: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            buttonText,
            style:  TextStyle(color: textColor, fontSize: 16,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
