import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'core/router/router.dart';
import 'core/theme/corkboard_theme.dart';

void main() {
  runApp(
    ProviderScope( // Required for Riverpod
      child: DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the router provider we just created
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: goRouter, // This is the "hook"
      title: 'My App',
      theme: CorkboardTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}