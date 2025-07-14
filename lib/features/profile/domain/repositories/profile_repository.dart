import 'dart:io';

import 'package:dating_app/features/profile/data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getProfile();
  Future<String> uploadPhoto(File file);
}
