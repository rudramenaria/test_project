import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final VoidCallback? onPressed;
  const AppButton({this.child,this.color,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(0,50)),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}