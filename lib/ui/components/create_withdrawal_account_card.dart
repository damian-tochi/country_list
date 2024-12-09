import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/consts/app_icons.dart';
import 'package:metro_pay/ui/screens/send_money/receipients.dart';

import '../../Theme/colors.dart';



class CreateWithdrawalAccountCard extends StatelessWidget {
  const CreateWithdrawalAccountCard({super.key,
    required this.onTap});

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
          Container(
            height: 60,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child:  ClipRRect(
            borderRadius:
            BorderRadius.circular(50),
            child: SvgPicture.asset(
              AppIcons.userOctagon,
              width: 30.0,
              height: 30.0,
            ),
          ),),

          Text("Create withdrawal account",
            style: CustomTheme.label.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const Spacer(),
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
