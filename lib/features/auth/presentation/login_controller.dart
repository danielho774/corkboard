import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/auth_repository.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() => null; // Initial state is "Data: null"

  Future<void> login(String email, String password) async {
    final repo = ref.read(authRepositoryProvider);
    
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repo.login(email, password));
  }
}