import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class GetProfileEvent extends ProfileEvent {}

class UploadPhotoEvent extends ProfileEvent {
  final File photoFile;

  const UploadPhotoEvent(this.photoFile);

  @override
  List<Object?> get props => [photoFile];
}
