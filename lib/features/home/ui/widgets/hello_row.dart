import 'package:flutter/material.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/theming/styles.dart';

class HelloRow extends StatelessWidget {
  const HelloRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: Styles.font28BlackSemiBold,
            textAlign: TextAlign.start,
          ),
          Text("Welcome to Laza.", style: Styles.font15GreyRegular),
        ],
      ),
    );
  }
}
