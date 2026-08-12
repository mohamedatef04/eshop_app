import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final String name;
  final String date;

  const ReviewItem({
    super.key,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://via.placeholder.com/32x32'),
            ),
            const SizedBox(width: 12),
            Text(
              name,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < 4 ? theme.colorScheme.secondary : theme.colorScheme.onSurface.withValues(alpha: 0.2),
                  size: 16,
                );
              }),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          date,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
