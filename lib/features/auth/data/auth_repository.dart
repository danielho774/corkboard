import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email != "admin@test.com" || password != "password123") {
      throw Exception("Invalid email or password");
    }
  }
}

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepository();