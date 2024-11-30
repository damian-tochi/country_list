import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Theme/colors.dart';


class PaymentOption {
  String title;
  String body;
  PaymentOption(this.title, this.body);
}

class PaymentOptionCard extends StatelessWidget {
  const PaymentOptionCard({super.key,
    required this.device,
    required this.onTap});

  final PaymentOption device;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.only(top: 18, bottom: 18, left: 20, right: 20),
      margin: const EdgeInsets.only(bottom: 10,),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                device.title.toString(),
                style: CustomTheme.label.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                device.body,
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
