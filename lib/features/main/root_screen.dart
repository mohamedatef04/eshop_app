import 'package:eshop_app/core/services/get_it_.dart';
import 'package:eshop_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:eshop_app/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:eshop_app/features/home/presentation/cubits/offres_cubit/offers_cubit.dart';
import 'package:eshop_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:eshop_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  static const route = '/root';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<OffersCubit>()..fetchOffers()),
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsCubit>()..fetchProducts(),
        ),
      ],
      child: const HomeScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[0],
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
