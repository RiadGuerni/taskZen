import 'dart:async';
import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:task_zenn/states/auth_state.dart';
import 'package:task_zenn/models/user.dart';
import 'package:task_zenn/providers/services/auth_service.dart';
import 'package:task_zenn/utils/storage.dart';

class AuthController extends AsyncNotifier<AuthState> {
  AuthService? authService;
  final storage = Storage();
  AuthController({required this.authService});

  @override
  FutureOr<AuthState> build() async {
    authService = ref.read(authServiceProvider);
    final user = await authService!.getCurrentUser();
    return AuthState(user: user);
  }

  Future<void> login(String email, String password) async {
    state = AsyncValue.loading();
    try {
      final response = await authService!.login(email, password);
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final user = User(
          email: email,
          token: body['token'],
          taskListId: body['taskListId'],
        );
        // WARNIINNGGGGGG !! Due to problems with the secure_storage package,
        // we are using shared_preferences to store the token  which is wrong for production x)
        storage.writeUser(user);
        state = AsyncValue.data(AuthState(user: user));
      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  Future<void> register(String email, String password) async {
    state = AsyncValue.loading();
    final storage = Storage();
    try {
      final response = await authService!.register(email, password);
      if (response.statusCode == 201) {
        final body = json.decode(response.body);
        final user = User(
          email: email,
          token: body['token'],
          taskListId: body['taskListId'],
        );
        // WARNIINNGGGGGG !! Due to problems with the secure_storage package,
        // we are using shared_preferences to store the token  which is wrong for production x)
        storage.writeUser(user);
        state = AsyncValue.data(AuthState(user: user));
      } else {
        throw Exception('Failed to register');
      }
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}

final authControllerProvider = AsyncNotifierProvider(
  () => AuthController(authService: null),
);
