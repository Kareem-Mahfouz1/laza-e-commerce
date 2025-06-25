import 'package:flutter/material.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/theming/styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding + 10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  'By connecting your account confirm that you agree with our',
              style: Styles.font13GreyRegular,
            ),
            TextSpan(
              text: ' Terms and Conditions',
              style: Styles.font13BlackMedium,
            ),
          ],
        ),
      ),
    );
  }
}
