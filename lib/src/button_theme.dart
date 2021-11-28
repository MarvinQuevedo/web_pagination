import 'package:flutter/material.dart';

class ButtonTheme extends InheritedWidget {
  ButtonTheme(
      {Key? key,
      required this.child,
      required this.buttonColor,
      required this.buttonTextColor,
      this.disableButton = false})
      : super(key: key, child: child);

  final Widget child;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final bool disableButton;

  static ButtonTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ButtonTheme>();
  }

  @override
  bool updateShouldNotify(ButtonTheme oldWidget) {
    return true;
  }
}
