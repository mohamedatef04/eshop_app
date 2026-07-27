import 'package:eshop_app/features/home/presentation/widgets/home_widgets/product_item.dart';
import 'package:flutter/material.dart';
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
          onSeeAll: () {},
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
            return const ProductItem();
          },
        ),
      ],
    );
  }
}
