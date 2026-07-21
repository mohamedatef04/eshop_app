import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;
  const Failures({required this.errorMessage});
}

class ServerFailure extends Failures {
  final int? statusCode;
  ServerFailure({required super.errorMessage, this.statusCode});

  factory ServerFailure.fromDioExeption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: "Connection timed out. Please try again.",
          statusCode: 408,
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: "Send request timed out. Please check your network.",
          statusCode: 408,
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: "Receive timeout from server. Try again later.",
          statusCode: 408,
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage: "Bad SSL certificate. Cannot verify server identity.",
        );

      case DioExceptionType.badResponse:
        final response = dioException.response;
        final statusCode = response?.statusCode;
        final data = response?.data;
        return ServerFailure.fromResponse(statusCode, data);

      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request was cancelled.");

      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage:
              "Connection error. Please check your internet connection.",
        );

      case DioExceptionType.unknown:
        final message = dioException.message ?? '';
        if (message.contains('SocketException')) {
          return ServerFailure(
            errorMessage:
                "No internet connection. Please check your internet connection.",
          );
        }
        return ServerFailure(
          errorMessage: "Unexpected error occurred. Please try again later.",
          statusCode: dioException.response?.statusCode,
        );
      case DioExceptionType.transformTimeout:
        throw ServerFailure(
          errorMessage: "Transform timeout. Please try again later.",
          statusCode: dioException.response?.statusCode,
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422 ||
        statusCode == 409 ||
        statusCode == 404) {
      if (response != null && response is Map) {
        if (response.containsKey('errors')) {
          final errors = response['errors'];
          String? errorMessage;

          if (errors is Map) {
            errorMessage = errors.values
                .map((e) {
                  if (e is List) return e.join(', ');
                  return e.toString();
                })
                .join('\n');
          } else if (errors is List) {
            errorMessage = errors.join('\n');
          } else if (errors is String) {
            errorMessage = errors;
          }

          if (errorMessage != null && errorMessage.isNotEmpty) {
            return ServerFailure(
              errorMessage: errorMessage,
              statusCode: statusCode,
            );
          }
        }
        if (response.containsKey('error_description')) {
          return ServerFailure(
            errorMessage: response['error_description'],
            statusCode: statusCode,
          );
        }
      }

      return ServerFailure(
        errorMessage:
            response?['message'] ??
            response?['error'] ??
            'Authentication error (Code: $statusCode)',
        statusCode: statusCode,
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal server error, please try again later.',
        statusCode: 500,
      );
    } else {
      return ServerFailure(
        errorMessage:
            'Oops, something went wrong. Please try again later. (Code: $statusCode)',
        statusCode: statusCode,
      );
    }
  }
}
