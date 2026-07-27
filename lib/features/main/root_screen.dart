import 'package:eshop_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:eshop_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  static const route = '/root';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[0],
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
