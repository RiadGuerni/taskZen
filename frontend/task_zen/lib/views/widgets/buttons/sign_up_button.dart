import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final Function onPressed;
  const SignUpButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => onPressed, child: const Text("Sign Up"));
  }
}
