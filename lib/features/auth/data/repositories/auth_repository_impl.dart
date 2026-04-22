import '../datasources/auth_remote_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User?> login(String email, String password) {
    return remoteDataSource.loginWithEmail(email, password);
  }
}