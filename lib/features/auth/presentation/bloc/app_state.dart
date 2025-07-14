import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

/// [MethodInitial] Başlangıç durumu.
/// [MethodSubmitted] Giriş işlemi için tetiklenen olay.
/// [MethodLoading] Giriş işlemi sırasında gösterilen yükleme durumu.
/// [MethodSuccess] Giriş işlemi başarılı olduğunda gösterilen durum.
/// [MethodFailure] Giriş işlemi başarısız olduğunda gösterilen durum.
class MethodInitial extends AppState {}

class MethodLoading extends AppState {}

class MethodSuccess extends AppState {}

class MethodFailure extends AppState {
  final String message;

  MethodFailure(this.message);

  @override
  List<Object> get props => [message];
}
