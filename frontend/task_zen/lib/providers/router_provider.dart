import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:task_zen/providers/controllers/auth_controller.dart';
import 'package:task_zen/views/home_page.dart';
import 'package:task_zen/views/loading_page.dart';
import 'package:task_zen/views/login_page.dart';
import 'package:task_zen/views/register_page.dart';
import 'package:task_zen/views/user_page.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: "/register", builder: (context, state) => RegisterPage()),
    GoRoute(path: "/home", builder: (context, state) => HomePage()),
    GoRoute(path: "/user", builder: (context, state) => UserPage()),
    GoRoute(path: "/loading", builder: (context, state) => LoadingPage()),
  ],
);
final routerProvider = Provider<GoRouter>((ref) {
  print("routerProvider");
  final authState = ref.watch(authControllerProvider);
  String initialRoute = '/loading';
  if (authState.hasError) {
    print("Error: ${authState.error}");
    initialRoute = '/login';
  }
  if (authState.hasValue) {
    print(" authState.value: ${authState.value}");
    if (authState.value!.user != null) {
      initialRoute = '/home';
    } else {
      initialRoute = '/login';
    }
  }
  goRouter.go(initialRoute);
  return goRouter;
});
