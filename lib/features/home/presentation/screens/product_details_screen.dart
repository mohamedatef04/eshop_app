import 'package:flutter/material.dart';
import '../widgets/product_details_widgets/add_to_cart_button.dart';
import '../widgets/product_details_widgets/product_image_section.dart';
import '../widgets/product_details_widgets/product_info_section.dart';
import '../../data/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  static const String route = '/product_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageSection(
                    productModel: productModel,
                  ),
                  ProductInfoSection(
                    productModel: productModel,
                  ),
                ],
              ),
            ),
          ),
          const AddToCartButton(),
        ],
      ),
    );
  }
}
