import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

class AuthRemoteDataSource with UiLoggy {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  // Kullanıcı kaydı için gerekli bilgileri alır ve sunucuya gönderir.
  Future<String> login(String email, String password) async {
    loggy.info("Giriş yapılıyor...");

    final response = await dio.post(
      "/user/login",
      data: {"email": email, "password": password},
    );
    loggy.info("Giriş yapıldı...");

    return response.data['data']['token'];
  }

  // Kullanıcı kaydı için gerekli bilgileri alır ve sunucuya gönderir.
  Future<String> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    loggy.info("Kayıt yapılıyor...");
    final response = await dio.post(
      "/user/register",
      data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      },
    );
    loggy.info("Kayıt yapıldı...");
    return response.data['data']['token'];
  }
}
