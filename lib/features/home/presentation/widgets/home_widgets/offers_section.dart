import 'package:eshop_app/features/home/data/models/offer_model.dart';
import 'package:eshop_app/features/home/presentation/cubits/offres_cubit/offers_cubit.dart';
import 'package:eshop_app/features/home/presentation/widgets/home_widgets/offer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (state is OffersSuccess) {
          return SizedBox(
            height: 140.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: state.offers.length, // Dummy count
              itemBuilder: (context, index) {
                return OfferItem(
                  offerModel: state.offers[index],
                );
              },
            ),
          );
        } else if (state is OffersFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return SizedBox(
            height: 140.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 3, // Dummy count
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: true,

                  child: OfferItem(
                    offerModel: OfferModel.placeHolder(),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
