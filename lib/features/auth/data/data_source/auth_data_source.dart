import 'package:eshop_app/core/api/api_service.dart';
import 'package:eshop_app/core/api/endpoints.dart';
import 'package:eshop_app/features/auth/data/models/login_response_model.dart';
import 'package:eshop_app/features/auth/data/models/register_request_model.dart';

abstract class AuthDataSource {
  Future<void> register({
    required RegisterRequestModel registerRequestModel,
  });
  Future<void> verifyEmailAfterRegisteration({
    required String email,
    required String otp,
  });
  Future<void> resendOtp({
    required String email,
  });
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiService apiService;

  AuthDataSourceImpl({required this.apiService});

  @override
  Future<void> register({
    required RegisterRequestModel registerRequestModel,
  }) async {
    await apiService.postRequest(
      endpoint: Endpoints.register,
      data: registerRequestModel.toJson(),
    );
  }

  @override
  Future<void> verifyEmailAfterRegisteration({
    required String email,
    required String otp,
  }) async {
    await apiService.postRequest(
      endpoint: Endpoints.verifyEmail,
      data: {
        'email': email,
        'otp': otp,
      },
    );
  }

  @override
  Future<void> resendOtp({required String email}) async {
    await apiService.postRequest(
      endpoint: Endpoints.resendOtp,
      data: {
        'email': email,
      },
    );
  }

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await apiService.postRequest(
      endpoint: Endpoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );
    final jsonData = response.data;
    return LoginResponseModel.fromJson(jsonData);
  }
}
