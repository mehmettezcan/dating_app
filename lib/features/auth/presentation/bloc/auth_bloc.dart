import 'package:dating_app/core/constants/constants.dart';
import 'package:dating_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dating_app/features/auth/presentation/bloc/app_state.dart';
import 'package:dating_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:dating_app/initializer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AppState> {
  final AuthRepository authRepository;
  final SharedPreferences prefs = getIt<SharedPreferences>();

  /// AuthBloc, kullanıcı giriş işlemlerini yönetir.
  /// [authRepository] Giriş işlemleri için kullanılan repository.
  AuthBloc(this.authRepository) : super(MethodInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  /// Giriş işlemini başlatır.
  /// [event] Giriş olayını içerir.
  /// [emit] Yeni durumu yayar.
  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AppState> emit,
  ) async {
    emit(MethodLoading());
    try {
      final token = await authRepository.login(event.email, event.password);
      await prefs.setString(authTokenDatingApp, token);

      emit(MethodSuccess());
    } catch (e) {
      emit(MethodFailure(e.toString()));
    }
  }

  /// Kayıt işlemini başlatır.
  /// [event] Kayıt olayını içerir.
  /// [emit] Yeni durumu yayar.
  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<AppState> emit,
  ) async {
    emit(MethodLoading());
    try {
      final token = await authRepository.register(
        event.name,
        event.email,
        event.password,
        event.confirmPassword,
      );

      await prefs.setString(authTokenDatingApp, token);

      emit(MethodSuccess());
    } catch (e) {
      emit(MethodFailure(e.toString()));
    }
  }
}
