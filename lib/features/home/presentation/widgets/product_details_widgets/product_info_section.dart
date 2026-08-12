import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import '../../../../../../generated/l10n.dart';
import 'product_selector.dart';
import 'quantity_selector.dart';

class ProductInfoSection extends StatelessWidget {
  ProductInfoSection({super.key, required this.productModel});
  final ProductModel productModel;

  final Map<String, Color> colors = {
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Green': Colors.green,
    'Black': Colors.black,
    'White': Colors.white,
    'Yellow': Colors.yellow,
    'Orange': Colors.orange,
    'Purple': Colors.purple,
    'Pink': Colors.pink,
    'Brown': Colors.brown,
    'Grey': Colors.grey,
    'Gray': Colors.grey,
    'Navy': const Color(0xFF001F3F),
    'Beige': const Color(0xFFF5F5DC),
    'Gold': const Color(0xFFFFD700),
    'Silver': const Color(0xFFC0C0C0),
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    bool isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isAr ? productModel.arName ?? '' : productModel.enName ?? '',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),

          Text(
            '\$${productModel.price}',
            style: AppTextStyles.semiBold20(context),
          ),

          SizedBox(height: 12.h),
          ProductSelector(
            title: s.color,
            colorValue: colors[productModel.color],
          ),
          const SizedBox(height: 12),
          const QuantitySelector(),
          const SizedBox(height: 24),

          // Description
          Text(
            isAr
                ? productModel.arDescription ?? ''
                : productModel.enDescription ?? '',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 24),

          // Shipping & Returns
          Text(
            s.shippingAndReturns,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            s.shippingPolicy,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 24),

          // Reviews
          Text(
            s.reviews,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                productModel.rating?.toString() ?? '0.0',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                s.ratings,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            spacing: 10.w,
            children: [
              Text(
                productModel.reviewCount?.toString() ?? '0',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              Text(S.of(context).reviews),
            ],
          ),

          // Review Items
        ],
      ),
    );
  }
}
