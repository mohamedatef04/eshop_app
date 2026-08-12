import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.isSelected,
    required this.onTap,
  });
  final CategoryModel categoryModel;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 55.w,
              height: 55.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: isSelected
                    ? Border.all(color: AppColors.accent, width: 2)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    categoryModel.image ?? '',
                  ), // Placeholder image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              categoryModel.name ?? '',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: isSelected
                  ? AppTextStyles.bold14(context).copyWith(
                      color: AppColors.accent,
                    )
                  : AppTextStyles.medium14(context),
            ),
          ],
        ),
      ),
    );
  }
}
