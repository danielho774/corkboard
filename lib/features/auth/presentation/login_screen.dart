import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_controller.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/assets.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the controller state
    final loginState = ref.watch(loginControllerProvider);

    // Listen for errors to show a SnackBar
    ref.listen(loginControllerProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error.toString())),
        );
      }
      
      // wait for AsyncLoading to finish before navigating
      if (next.hasValue && !next.isLoading) {
        context.go('/dashboard');
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo, width: 100, height: 100),
            const SizedBox(height: 40),
            const TextField(decoration: InputDecoration(labelText: 'Email')),
            const TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // Disable button if loading
                onPressed: loginState.isLoading 
                  ? null 
                  : () => ref.read(loginControllerProvider.notifier).login("admin@test.com", "password123"),
                child: loginState.isLoading 
                  ? const CircularProgressIndicator() 
                  : const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}