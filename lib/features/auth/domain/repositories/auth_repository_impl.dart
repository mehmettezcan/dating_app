import 'package:dating_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dating_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:loggy/loggy.dart';

class AuthRepositoryImpl with UiLoggy implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  // Kullanıcı giriş işlemini gerçekleştirir.
  @override
  Future<String> login(String email, String password) {
    try {
      loggy.info("Giriş yapılıyor...", email);
      return remote.login(email, password);
    } catch (e) {
      loggy.error("Giriş yapma hatası: $e", e);
      rethrow;
    }
  }

  // Kullanıcı kayıt işlemini gerçekleştirir.
  @override
  Future<String> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) {
    try {
      loggy.info("Kayıt yapılıyor...", email);
      return remote.register(name, email, password, confirmPassword);
    } catch (e) {
      loggy.error("Kayıt yapma hatası: $e", e);
      rethrow;
    }
  }
}
