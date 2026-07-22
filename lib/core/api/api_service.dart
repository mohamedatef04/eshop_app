import 'dart:async';

import 'package:dio/dio.dart';
import 'package:eshop_app/core/api/endpoints.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options.baseUrl = dotenv.get('BASE_URL');
    dio.options.headers = {'accept': 'application/json'};

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) async {
    //       const storage = FlutterSecureStorage();
    //       final token = await storage.read(key: 'access_token');
    //       if (token != null) {
    //         options.headers['Authorization'] = 'Bearer $token';
    //       }
    //       return handler.next(options);
    //     },
    //     onError: (error, handler) async {
    //       // Check if it's a 401 and the request was NOT the refresh token request itself
    //       if (error.response?.statusCode == 401 &&
    //           error.requestOptions.path != Endpoints.refreshToken) {
    //         const storage = FlutterSecureStorage();
    //         final refreshToken = await storage.read(key: 'refresh_token');

    //         if (refreshToken != null) {
    //           try {
    //             final response = await dio.post(
    //               Endpoints.refreshToken,
    //               data: {
    //                 'refreshToken': refreshToken,
    //                 'useCookies': true,
    //               },
    //             );

    //             final newAccessToken = response.data['accessToken'];
    //             final newRefreshToken = response.data['refreshToken'];

    //             await storage.write(key: 'access_token', value: newAccessToken);
    //             await storage.write(
    //               key: 'refresh_token',
    //               value: newRefreshToken,
    //             );

    //             // Update the failed request's header with the new token
    //             error.requestOptions.headers['Authorization'] =
    //                 'Bearer $newAccessToken';

    //             // Retry the original request
    //             return handler.resolve(
    //               await dio.request(
    //                 error.requestOptions.path,
    //                 options: Options(
    //                   method: error.requestOptions.method,
    //                   headers: error.requestOptions.headers,
    //                 ),
    //                 data: error.requestOptions.data,
    //                 queryParameters: error.requestOptions.queryParameters,
    //               ),
    //             );
    //           } catch (e) {
    //             // If the refresh request fails (e.g. refresh token expired), clear storage
    //             await storage.delete(key: 'access_token');
    //             await storage.delete(key: 'refresh_token');
    //             // You could also trigger a global logout event here

    //             return handler.next(error);
    //           }
    //         }
    //       }
    //       return handler.next(error);
    //     },
    //   ),
    // );
  }

  // Requests
  Future<Response> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    return await dio.get(endpoint, queryParameters: queryParams);
  }

  Future<Response> postRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    required dynamic data,
  }) async {
    return await dio.post(endpoint, data: data, queryParameters: queryParams);
  }

  Future<Response> updateRequest({
    required String endpoint,
    required dynamic data,
  }) async {
    return await dio.put(endpoint, data: data);
  }

  Future<Response> deleteRequest({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    return await dio.delete(endpoint, data: data);
  }
}
