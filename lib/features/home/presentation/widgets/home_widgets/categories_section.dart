import 'package:eshop_app/features/home/data/models/category_model.dart';
import 'package:eshop_app/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:eshop_app/features/home/presentation/widgets/home_widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'header_section.dart';
import '../../../../../../generated/l10n.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(
          title: S.of(context).categories,
          onSeeAll: () {},
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
                    return CategoryItem(categoryModel: state.categories[index]);
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
