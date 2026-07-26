part of 'validate_otp_cubit.dart';

@immutable
sealed class ValidateOtpState {}

final class ValidateOtpInitial extends ValidateOtpState {}

final class ValidateOtpLoading extends ValidateOtpState {}

final class ValidateOtpSuccess extends ValidateOtpState {}

final class ValidateOtpError extends ValidateOtpState {
  final String errorMessage;
  ValidateOtpError({required this.errorMessage});
}
