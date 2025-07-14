import 'package:dating_app/features/home/data/models/movie.dart';
import 'package:dating_app/features/profile/data/models/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profile;
  final List<MovieModel?> favorites;

  ProfileSuccess(this.profile, this.favorites);
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure(this.message);
}

class PhotoUploadSuccess extends ProfileState {
  final String fileUrl;
  PhotoUploadSuccess(this.fileUrl);
}
