import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/theming/styles.dart';
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
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            itemCount: 10,
            itemBuilder: (context, index) {
              return CatigoreyItem();
            },
          ),
        ),
      ],
    );
  }
}
