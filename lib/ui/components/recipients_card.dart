import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/ui/screens/send_money/receipients.dart';

import '../../Theme/colors.dart';



class RecipientsCard extends StatelessWidget {
  const RecipientsCard({super.key,
    required this.device,
    required this.onTap});

  final Recipient device;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 10,),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius:
            BorderRadius.circular(50),
            child: Image.asset(
              device.img,
              width: 60.0,
              height: 60.0,
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
          ),),

          SvgPicture.asset(
            'assets/images/small-arrow-right.svg',
            width: 20.0,
            height: 20.0,
          ),

        ],
      ),
    ),);
  }
}
