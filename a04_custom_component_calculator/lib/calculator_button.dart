import "package:flutter/material.dart";

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  IconData? icon;
  CalculatorButton({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
  });
  CalculatorButton.Icon({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: icon == null
            ? Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: foregroundColor),
              )
            : Icon(
                icon,
                color: foregroundColor,
              ),
      ),
    );
  }
}
