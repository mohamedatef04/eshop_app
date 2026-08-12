import 'package:animate_do/animate_do.dart';
import 'package:eshop_app/features/home/data/models/category_model.dart';
import 'package:eshop_app/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:eshop_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:eshop_app/features/home/presentation/widgets/home_widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'header_section.dart';
import '../../../../../../generated/l10n.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(
          title: S.of(context).categories,
        ),
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesSuccess) {
              return SizedBox(
                height: 80.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return FadeInLeft(
                      child: CategoryItem(
                        categoryModel: state.categories[index],
                        isSelected: _selectedIndex == index,
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                          context.read<ProductsCubit>().fetchProducts(
                            category: state.categories[index].name,
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            } else if (state is CategoriesFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return SizedBox(
                height: 80.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 6, // Dummy count
                  itemBuilder: (context, index) {
                    return Skeletonizer(
                      enabled: true,
                      child: CategoryItem(
                        categoryModel: CategoryModel.placeHolder(),
                        isSelected: false,
                        onTap: () {},
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
