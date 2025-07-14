import 'dart:io';

import 'package:dating_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:dating_app/features/profile/data/models/profile_model.dart';
import 'package:loggy/loggy.dart';

import 'profile_repository.dart';

class ProfileRepositoryImpl with UiLoggy implements ProfileRepository {
  final ProfileRemoteDatasource remote;

  ProfileRepositoryImpl(this.remote);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      loggy.info("Profil alınıyor...");
      return remote.getProfile();
    } catch (e) {
      loggy.error("Profil hatası: $e", e);
      rethrow;
    }
  }

  @override
  Future<String> uploadPhoto(File file) async {
    try {
      loggy.info("Profil fotoğrafı yükleniyor...");
      return remote.uploadPhoto(file);
    } catch (e) {
      loggy.error("Profil fotoğrafı hatası: $e", e);
      rethrow;
    }
  }
}
