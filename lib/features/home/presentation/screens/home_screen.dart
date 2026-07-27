import 'package:flutter/material.dart';
import '../widgets/home_widgets/categories_section.dart';
import '../widgets/home_widgets/home_header.dart';
import '../widgets/home_widgets/offers_section.dart';
import '../widgets/home_widgets/products_section.dart';
import '../widgets/home_widgets/search_and_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HomeHeader()),
            SliverToBoxAdapter(child: SearchAndFilter()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: OffersSection()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: CategoriesSection()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: ProductsSection()),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
