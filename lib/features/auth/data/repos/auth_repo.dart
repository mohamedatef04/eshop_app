import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eshop_app/core/errors/failures.dart';
import 'package:eshop_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:eshop_app/features/auth/data/models/login_response_model.dart';
import 'package:eshop_app/features/auth/data/models/register_request_model.dart';

class AuthRepo {
  final AuthDataSource authDataSource;
  AuthRepo({required this.authDataSource});

  Future<Either<Failures, void>> register({
    required RegisterRequestModel registerRequestModel,
  }) async {
    try {
      final res = await authDataSource.register(
        registerRequestModel: registerRequestModel,
      );
      return right(res);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<Either<Failures, void>> verifyEmailAfterRegisteration({
    required String email,
    required String otp,
  }) async {
    try {
      final res = await authDataSource.verifyEmailAfterRegisteration(
        email: email,
        otp: otp,
      );
      return right(res);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<Either<Failures, void>> resendOtp({
    required String email,
  }) async {
    try {
      final res = await authDataSource.resendOtp(
        email: email,
      );
      return right(res);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<Either<Failures, LoginResponseModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await authDataSource.login(
        email: email,
        password: password,
      );
      return right(res);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
