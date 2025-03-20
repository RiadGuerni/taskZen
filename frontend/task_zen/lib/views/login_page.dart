import 'package:flutter/material.dart';
import 'package:task_zen/views/auth_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPage(isLogin: true);
  }
}
