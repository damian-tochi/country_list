import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Consts/global_func.dart';


class NumberKeyboard extends StatelessWidget {
  final Function(String) onKeyboardTap;

  const NumberKeyboard({super.key, required this.onKeyboardTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2/1.13,
      ),
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index == 11) {
          return GestureDetector(
            onTap: () {
              onKeyboardTap('delete');
            },
            child: Container(
                margin: const EdgeInsets.all(6),
                width: double.maxFinite,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: HexColor.fromHex("#F9F9F9"),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                'assets/images/backspace.svg',
                width: 10.0,
                height: 10.0,
              )
            ),
          );
        }

        if (index == 9) {
          return GestureDetector(
            onTap: () {
              onKeyboardTap('.');
            },
            child: Container(
                margin: const EdgeInsets.all(6),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: HexColor.fromHex("#F9F9F9"),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text('.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
          );
        }
        return GestureDetector(
          onTap: () {
            onKeyboardTap(index == 10 ? '0' : '${index + 1}');
          },
          child: Container(
              margin: const EdgeInsets.all(4),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: HexColor.fromHex("#F9F9F9"),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  index == 10 ? '0' : '${index + 1}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
        );
      },
    );
  }
}
