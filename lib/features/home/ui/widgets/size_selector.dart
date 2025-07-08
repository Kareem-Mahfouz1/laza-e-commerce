import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/features/home/ui/widgets/size_item.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  final List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Row(
          children: [
            Text('Size', style: Styles.font17BlackSemiBold),
            Spacer(),
            Text('Size Guide', style: Styles.font13GreyRegular),
          ],
        ),
        SizedBox(
          height: 60.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return SizeItem(
                size: sizes[index],
                isSelected: index == selectedIndex,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
