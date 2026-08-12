import 'package:animate_do/animate_do.dart';
import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/features/home/data/models/product_model.dart';
import 'package:eshop_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:eshop_app/features/home/presentation/widgets/home_widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'header_section.dart';
import '../../../../../../generated/l10n.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(
          title: S.of(context).products,
        ),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsSuccess) {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: state.products.length, // Dummy count
                itemBuilder: (context, index) {
                  return FadeInUp(
                    child: ProductItem(productModel: state.products[index]),
                  );
                },
              );
            } else if (state is ProductsFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else if (state is ProductsEmptyState) {
              return Center(
                child: Text(
                  S.of(context).no_products_found,
                  style: AppTextStyles.bold18(context),
                ),
              );
            } else {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 6, // Dummy count
                itemBuilder: (context, index) {
                  return Skeletonizer(
                    enabled: true,
                    child: ProductItem(
                      productModel: ProductModel.placeHolder(),
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
