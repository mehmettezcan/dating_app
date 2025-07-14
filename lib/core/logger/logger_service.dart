import 'package:loggy/loggy.dart';

abstract class LoggerService {
  void debug(String message);
  void info(String message);
  void warning(String message);
  void error(String message, [Object? error, StackTrace? stackTrace]);
}

class LoggerServiceImpl extends LoggerService {
  final _log = Loggy('LoggerService');

  @override
  void debug(String message) {
    _log.debug(message);
  }

  @override
  void info(String message) {
    _log.info(message);
  }

  @override
  void warning(String message) {
    _log.warning(message);
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _log.error(message, error, stackTrace);
  }
}
