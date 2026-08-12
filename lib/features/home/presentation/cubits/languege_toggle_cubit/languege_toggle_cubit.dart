import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguegeToggleCubit extends Cubit<Locale> {
  LanguegeToggleCubit() : super(const Locale('en'));

  void toggleLanguage(Locale locale) {
    emit(locale);
  }
}
