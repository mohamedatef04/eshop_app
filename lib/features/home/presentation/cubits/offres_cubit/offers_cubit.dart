import 'package:equatable/equatable.dart';
import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/home/data/models/offer_model.dart';
import 'package:eshop_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this.homeRepo) : super(OffersInitial());
  final HomeRepo homeRepo;

  Future<void> fetchOffers() async {
    safeEmit(OffersLoading());
    final result = await homeRepo.getOffers();
    result.fold(
      (failure) => safeEmit(OffersFailure(errMessage: failure.errorMessage)),
      (offers) => safeEmit(OffersSuccess(offers: offers)),
    );
  }
}
