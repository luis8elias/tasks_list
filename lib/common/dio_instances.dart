import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import '/config/app_constants.dart';

final dioInstance = addInterceptors(
  Dio(
    BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      baseUrl: apiUrl!,
      validateStatus: (status) =>  status! < 500
    )
  )
);

Dio addInterceptors(Dio dio) {
  const interceptors = Interceptors();
  return dio..interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) {
        interceptors.requestInterceptor(options, handler);
      },
    ),
  );
}

class Interceptors{

  const Interceptors();

  Future<void>  requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler
  ) async {
    
    options.headers.addAll({HttpHeaders.authorizationHeader: "bearer $apiKey"});
    if(options.method == 'POST' ||  options.method == 'PUT'){

      final currentData = jsonDecode(options.data) as Map<String,dynamic>;
      currentData.addAll({
        'token' : apiKey
      });
      options.data = currentData;
      
    }else{

      options.queryParameters.addAll({
        'token': apiKey
      });

    }
    return handler.next(options);
  }
}