import 'dart:async';
import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:task_zen/providers/services/user_service.dart';
import 'package:task_zen/states/auth_state.dart';
import 'package:task_zen/providers/services/auth_service.dart';

class AuthController extends AsyncNotifier<AuthState> {
  UserService userService = UserService();
  AuthService authService = AuthService();
  AuthController();

  @override
  FutureOr<AuthState> build() async {
    final user = await userService.getCurrentUser();
    return AuthState(user: user);
  }

  Future<void> login(String username, String password) async {
    state = AsyncValue.loading();
    try {
      final response = await authService.login(username, password);
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final user = userService.createUser(
          username,
          body['token'],
          body['taskListId'],
        );
        state = AsyncValue.data(AuthState(user: user));
      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  Future<void> signUp(String username, String password) async {
    state = AsyncValue.loading();
    try {
      final response = await authService.signUp(username, password);
      if (response.statusCode == 201) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        final user = userService.createUser(
          username,
          body['token'],
          body['taskListId'],
        );
        state = AsyncValue.data(AuthState(user: user));
      } else {
        throw Exception('Failed to signUp');
      }
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  Future<void> getCurrentUser() async {
    final user = await userService.getCurrentUser();
    state = AsyncValue.data(AuthState(user: user));
  }

  Future<void> logout() async {
    final user = state.requireValue.user!;
    userService.logout(user);
    state = AsyncValue.data(AuthState(user: null));
  }
}

final authControllerProvider = AsyncNotifierProvider(() => AuthController());
