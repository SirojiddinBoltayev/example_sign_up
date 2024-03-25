import 'package:dio/dio.dart';


import '../../constants/secret_vars.dart';

class HttpService {
  Dio client({bool requireAuth = false, bool? requiredPost}) => Dio(
        BaseOptions(
          baseUrl: SecretVars.baseUrl,
          connectTimeout: const Duration(minutes: 1),
          receiveTimeout: const Duration(minutes: 1),
          sendTimeout: const Duration(minutes: 1),
          headers: {
            'Accept': 'application/json',
            'Accept-Language': "uz",
            // 'Content-type': 'application/json',
            // 'Authorization': 'Bearer ${LocalStorage.instance.getToken()}'
          },
        ),
      )
        // ..interceptors.add(TokenInterceptor(requireAuth: requireAuth))
        ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true))
        // ..interceptors.add(RequestsInspectorInterceptor())
        // ..interceptors.add(CachedInterceptor(requiredPost: requiredPost))
        // ..transformer = FlutterTransformer()
  ;
}
