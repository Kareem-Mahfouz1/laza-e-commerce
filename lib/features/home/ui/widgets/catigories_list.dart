import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:laza/features/home/ui/widgets/catigorey_item.dart';

class CatigoriesList extends StatelessWidget {
  const CatigoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 15.h,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Choose Brand', style: Styles.font17BlackSemiBold),
              Text('View All', style: Styles.font13GreyRegular),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesSuccess) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          Routes.categoryScreen,
                          extra: state.categories[index],
                        );
                      },
                      child: CatigoreyItem(category: state.categories[index]),
                    );
                  },
                );
              } else if (state is CategoriesError) {
                return Center(child: Text(state.error));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
