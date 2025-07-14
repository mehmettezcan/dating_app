import 'package:dating_app/features/home/domain/repositories/home_repository.dart';
import 'package:dating_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:dating_app/initializer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  final HomeRepository homeRepository;
  final SharedPreferences prefs = getIt<SharedPreferences>();

  ProfileBloc(this.profileRepository, this.homeRepository)
    : super(ProfileInitial()) {
    on<GetProfileEvent>(_onGetProfile);
    on<UploadPhotoEvent>(_onUploadPhoto);
  }

  /// Profil bilgilerini alır.
  /// [event] Profil alma olayını içerir.
  /// [emit] Yeni durumu yayar.
  Future<void> _onGetProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await profileRepository.getProfile();
      final favorites = await homeRepository.fetchFavorites();

      emit(ProfileSuccess(profile, favorites));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }

  Future<void> _onUploadPhoto(
    UploadPhotoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      var fileUrl = await profileRepository.uploadPhoto(event.photoFile);
      emit(PhotoUploadSuccess(fileUrl));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }
}
