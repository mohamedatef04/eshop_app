// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter_bloc/flutter_bloc.dart';

extension SafeEmit<S> on Cubit<S> {
  void safeEmit(S state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
