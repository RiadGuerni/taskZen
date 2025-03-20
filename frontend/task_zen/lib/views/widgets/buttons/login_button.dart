import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function onPressed;
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => onPressed, child: const Text("Login"));
  }
}
