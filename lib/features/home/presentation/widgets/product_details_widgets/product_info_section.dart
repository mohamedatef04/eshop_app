import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import 'product_selector.dart';
import 'quantity_selector.dart';
import 'review_item.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "Men's Harrington Jacket",
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Price
          Text(
            '\$148',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          
          // Selectors
          const ProductSelector(title: "Size", value: "S"),
          const SizedBox(height: 12),
          ProductSelector(title: s.color, colorValue: Colors.brown.shade300),
          const SizedBox(height: 12),
          const QuantitySelector(),
          
          const SizedBox(height: 24),
          
          // Description
          Text(
            'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 24),
          
          // Shipping & Returns
          Text(
            'Shipping & Returns',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Free standard shipping and free 60-day returns',
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
                '4.5',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Ratings',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '213 Reviews',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          
          // Review Items
          const ReviewItem(name: 'Alex Morgan', date: '12days ago'),
          const SizedBox(height: 16),
          const ReviewItem(name: 'Alex Morgan', date: '12days ago'),
        ],
      ),
    );
  }
}

