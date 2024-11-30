import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/ui/screens/send_money/receipients.dart';

import '../../Theme/colors.dart';
import '../../consts/app_icons.dart';

class SettingItemClickableCard extends StatelessWidget {
  const SettingItemClickableCard(
      {super.key, required this.title, required this.onTap});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(
          top: 10,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45,
              width: 45,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: const Color(0xffD1E5D3),
                borderRadius: BorderRadius.circular(40),
              ),
              padding: const EdgeInsets.all(9),
              child: SvgPicture.asset(
                AppIcons.cloudLightningIcon,
                height: 12,
                width: 12,
              ),
            ),
            Expanded(
              child:
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text(
                  title,
                  style: CustomTheme.label.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ]),
            ),
            SvgPicture.asset(
              'assets/images/small-arrow-right.svg',
              width: 20.0,
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
