import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_zen/providers/controllers/auth_controller.dart';
import 'package:task_zen/views/widgets/buttons/login_button.dart';
import 'package:task_zen/views/widgets/buttons/sign_up_button.dart';
import 'package:task_zen/views/widgets/textfields/confirm_password_field.dart';

import 'package:task_zen/views/widgets/textfields/password_field.dart';
import 'package:task_zen/views/widgets/textfields/username_field.dart';

class AuthPage extends ConsumerWidget {
  final bool isLogin;
  final UsernameField usernameField = UsernameField();
  final PasswordField passwordField = PasswordField();
  final ConfirmPasswordField confirmPasswordField = ConfirmPasswordField();
  AuthPage({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                isLogin
                    ? Image.asset("assets/login.png")
                    : Image.asset("assets/signup.png"),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    isLogin
                        ? Column(
                          children: [
                            Text(
                              "Sign in",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'Please enter your informations to continue',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        )
                        : Column(
                          children: [
                            Text(
                              "Sign up",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'Please enter your informations to continue',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                usernameField,
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                passwordField,
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                !isLogin
                    ? confirmPasswordField
                    : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                !isLogin
                    ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    )
                    : SizedBox(),
                isLogin
                    ? LoginButton(
                      onPressed: () {
                        // validate userName and password function not yet implemented
                        final username = usernameField.usernameController.text;
                        final password = passwordField.passwordController.text;
                        final authController = ref.read(
                          authControllerProvider.notifier,
                        );

                        authController.login(username, password);
                      },
                    )
                    : SignUpButton(
                      onPressed: () {
                        // validate userName and password function not yet implemented
                        final username = usernameField.usernameController.text;
                        final password = passwordField.passwordController.text;
                        print("the sign up button was pressed");
                        final authController = ref.read(
                          authControllerProvider.notifier,
                        );

                        authController.signUp(username, password);
                      },
                    ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                isLogin
                    ? GestureDetector(
                      onTap: () {
                        context.go("/register");
                      },
                      child: Text(
                        "Don't have an account? Sign up",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    )
                    : GestureDetector(
                      onTap: () {
                        context.go("/login");
                      },
                      child: Text(
                        "Already have an account? Sign in",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
