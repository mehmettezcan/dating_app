abstract class AuthRepository {
  // Kullanıcı giriş işlemini gerçekleştirir.
  /// [email] Kullanıcının e-posta adresi.
  /// [password] Kullanıcının şifresi.
  Future<String> login(String email, String password);

  // Kullanıcı kayıt işlemini gerçekleştirir.
  /// [name] Kullanıcının adı.
  /// [email] Kullanıcının e-posta adresi.
  /// [password] Kullanıcının şifresi.
  /// [confirmPassword] Kullanıcının şifresini onaylamak için tekrar g
  Future<String> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  );
}
