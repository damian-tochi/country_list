import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/ui/screens/send_money/receipients.dart';

import '../../Theme/colors.dart';

class AccountSelectCard extends StatelessWidget {
  const AccountSelectCard(
      {super.key,
      required this.device,
      required this.onTap,
      required this.selectedIndex});

  final Recipient device;
  final void Function() onTap;
  final bool? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0x7FD7D7D7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              margin: const EdgeInsets.only(right: 9),
              padding: const EdgeInsets.all(13),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: SvgPicture.asset(
                  device.img,
                  width: 12.0,
                  height: 12.0,
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device.name.toString(),
                    style: CustomTheme.label.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    device.accType,
                    style: CustomTheme.label.copyWith(
                      color: const Color(0xFF696969),
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex?? false ? Colors.white : Colors.transparent,
                border: Border.all(
                  color: selectedIndex?? false ? const Color(0xFF1D432E) : const Color(0xFFD7D7D7),
                  width: selectedIndex?? false ? 7 : 2.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
