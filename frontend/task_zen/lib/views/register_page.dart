import 'package:flutter/material.dart';
import 'package:task_zen/views/auth_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPage(isLogin: false);
  }
}
