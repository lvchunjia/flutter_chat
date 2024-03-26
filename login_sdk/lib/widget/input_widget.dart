import 'package:flutter/material.dart';

///自定义widget，登录输入框
class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.hint,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
  });

  final String hint;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;

  get _input {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        hintStyle: const TextStyle(fontSize: 17, color: Colors.grey),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      autofocus: !obscureText,
      cursorColor: Colors.white,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _input,
        const Divider(color: Colors.white, height: 1, thickness: 0.5),
      ],
    );
  }
}
