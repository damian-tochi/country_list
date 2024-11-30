import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro_pay/consts/app_icons.dart';

class EmptyTransactions extends StatelessWidget {
  final double screenHeight;

  const EmptyTransactions(
    this.screenHeight, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: screenHeight * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppIcons.folderIcon,
            height: 30,
            width: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'No transaction history',
            style: TextStyle(
                color: Color(0xFF696969),
                fontSize: 16,
                fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
