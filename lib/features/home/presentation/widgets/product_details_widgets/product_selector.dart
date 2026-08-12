import 'package:flutter/material.dart';

class ProductSelector extends StatelessWidget {
  final String title;

  final Color? colorValue;

  const ProductSelector({
    super.key,
    required this.title,

    this.colorValue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),

          if (colorValue != null)
            CircleAvatar(
              radius: 8,
              backgroundColor: colorValue,
            ),
        ],
      ),
    );
  }
}
