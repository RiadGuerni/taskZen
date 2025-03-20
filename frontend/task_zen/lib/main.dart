import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:task_zen/providers/router_provider.dart";
import 'package:task_zen/styles/theme.dart';
import 'package:task_zen/providers/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService().createCache();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Task Zen',
      theme: lightPurpleTheme(context),
      routerConfig: router,
    );
  }
}
