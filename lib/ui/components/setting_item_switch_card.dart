import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Theme/colors.dart';
import '../../consts/app_icons.dart';


class SettingItemSwitchCard extends StatelessWidget {
  const SettingItemSwitchCard(
      {super.key, required this.title, required this.onChange, required this.stateValue});

  final String title;
  final bool stateValue;
  final void Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            SizedBox(
              width: 55,
              height: 45,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Switch(
                  activeColor: Colors.white,
                  activeTrackColor: Colors.black,
                  inactiveThumbColor: const Color(0xFF040405),
                  inactiveTrackColor: const Color(0x4FBAE5A4),
                  splashRadius: 30.0,
                  value: stateValue,
                  onChanged: onChange,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
