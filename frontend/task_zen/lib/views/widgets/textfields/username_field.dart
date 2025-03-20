import 'package:flutter/material.dart';

class UsernameField extends StatefulWidget {
  final TextEditingController usernameController = TextEditingController();
  UsernameField({super.key});

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  void dispose() {
    widget.usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: widget.usernameController,
        decoration: InputDecoration(hintText: "Enter your username"),
      ),
    );
  }
}
