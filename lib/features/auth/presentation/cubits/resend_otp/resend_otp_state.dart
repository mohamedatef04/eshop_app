part of 'resend_otp_cubit.dart';

@immutable
sealed class ResendOtpState {}

final class ResendOtpInitial extends ResendOtpState {}

final class ResendOtpLoading extends ResendOtpState {}

final class ResendOtpSuccess extends ResendOtpState {}

final class ResendOtpError extends ResendOtpState {
  final String errorMessage;
  ResendOtpError({required this.errorMessage});
}
