part of 'forget_pass_cubit.dart';

@immutable
sealed class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class ForgetPassLoading extends ForgetPassState {}

final class ForgetPassSuccess extends ForgetPassState {}

final class ForgetPassError extends ForgetPassState {
  final String errorMessage;
  ForgetPassError({required this.errorMessage});
}
