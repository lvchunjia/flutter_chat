import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
    this.title, {
    super.key,
    this.enable = true,
    this.onPressed,
  });

  final String title;
  final bool enable;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      height: 45,
      disabledColor: Colors.white60,
      color: Colors.blueGrey,
      onPressed: enable ? onPressed : null,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
