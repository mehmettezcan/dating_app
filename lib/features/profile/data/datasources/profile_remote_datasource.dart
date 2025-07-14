import 'dart:io';

import 'package:dating_app/features/profile/data/models/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

class ProfileRemoteDatasource with UiLoggy {
  final Dio dio;

  ProfileRemoteDatasource(this.dio);

  // Kullanıcı profilini almak için gerekli bilgileri alır ve sunucuya gönderir.
  Future<ProfileModel> getProfile() async {
    loggy.info("Profil Alınıyor...");

    final response = await dio.get("/user/profile");

    return ProfileModel.fromJson(response.data['data']);
  }

  // Kullanıcı profil fotoğrafını yükler.
  Future<String> uploadPhoto(File file) async {
    loggy.info("Fotoğraf Yükleniyor...");
    if (!file.existsSync()) {
      loggy.info("Dosya bulunamadı...");

      throw Exception("Dosya bulunamadı: ${file.path}");
    }

    if (!file.path.endsWith('.jpg') && !file.path.endsWith('.png')) {
      loggy.info("Dosya uzantısı geçersiz...");
      throw Exception(
        "Yalnızca .jpg veya .png dosyaları yüklenebilir: ${file.path}",
      );
    }

    var multipartFile = await MultipartFile.fromFile(file.path);

    loggy.info("MultipartFile oluşturuldu: $multipartFile");

    final formData = FormData.fromMap({'file': multipartFile});

    loggy.info("FormData oluşturuldu: $formData");

    final response = await dio.post(
      '/user/upload_photo',
      data: formData,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );

    loggy.info("Fotoğraf yüklendi: ${response.data}");

    return response.data["data"]["photoUrl"];
  }
}
