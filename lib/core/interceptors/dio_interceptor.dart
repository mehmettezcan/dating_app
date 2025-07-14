import 'package:dating_app/initializer.dart';
import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

class DioInterceptor extends Interceptor {
  late final Loggy _loggy = getIt<Loggy>();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _loggy.debug('Request: ${options.method} ${options.uri}');
    _loggy.debug('Headers: ${options.headers}');
    _loggy.debug('Data: ${options.data}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _loggy.debug(
      'Response: ${response.statusCode} ${response.requestOptions.uri}',
    );
    _loggy.debug('Data: ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _loggy.debug(
      'Error: ${err.response?.statusCode} ${err.requestOptions.uri}',
    );
    _loggy.debug('Message: ${err.message}');
    return handler.next(err);
  }
}
