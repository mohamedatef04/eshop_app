import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/auth/data/models/register_request_model.dart';
import 'package:eshop_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;

  Future<void> register({
    required RegisterRequestModel registerRequestModel,
  }) async {
    safeEmit(RegisterLoading());
    final result = await authRepo.register(
      registerRequestModel: registerRequestModel,
    );
    result.fold(
      (l) {
        emit(RegisterFailure(errorMessage: l.errorMessage));
      },
      (r) {
        emit(RegisterSuccess());
      },
    );
  }
}
