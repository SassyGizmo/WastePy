import '../repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User?> execute(String email, String password) {
    return repository.login(email, password);
  }
}