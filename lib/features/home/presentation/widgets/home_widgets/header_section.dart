import 'package:eshop_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const HeaderSection({
    super.key,
    required this.title,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onSeeAll ?? () {},
            child: Text(
              S.of(context).see_all,
              style: const TextStyle(color: AppColors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
