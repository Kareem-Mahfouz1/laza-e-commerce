import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/styles.dart';

class DescriptionColumn extends StatefulWidget {
  const DescriptionColumn({super.key});

  @override
  State<DescriptionColumn> createState() => _DescriptionColumnState();
}

class _DescriptionColumnState extends State<DescriptionColumn> {
  bool isExpanded = false;
  bool isOverflowing = false;

  final String desc =
      'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with classic comfort. It features an adjustable hood and ribbed cuffs for a snug fit. Ideal for layering or wearing solo on cooler days.';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => checkOverflow());
  }

  void checkOverflow() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: desc, style: Styles.font15GreyRegular),
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 40.w);

    setState(() {
      isOverflowing = textPainter.didExceedMaxLines;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: Styles.font17BlackSemiBold),
        SizedBox(height: 10.h),
        AnimatedCrossFade(
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
          firstChild: Text(
            desc,
            style: Styles.font15GreyRegular,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          secondChild: Text(desc, style: Styles.font15GreyRegular),
        ),
        if (isOverflowing) ...[
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Text(
              isExpanded ? 'Show less' : 'Read more',
              style: Styles.font15BlackMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
