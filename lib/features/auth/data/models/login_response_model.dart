class LoginResponseModel {
  final String? accessToken;
  final String? refreshToken;
  final String? expiresAtUtc;

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        accessToken: json['accessToken'] ?? '',
        refreshToken: json['refreshToken'] ?? '',
        expiresAtUtc: json['expiresAtUtc'] ?? '',
      );
}
