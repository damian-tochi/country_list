import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Theme/colors.dart';

class AuthInputField extends StatelessWidget {
  final String? label;
  final String? icon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;

  const AuthInputField({
    super.key,
    this.label,
    this.icon,
    required this.controller,
    this.focusNode,
    this.nextFocus,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 15, right: 35, top: 20, bottom: 20),
        height: 70,
        color: Colors.white,
        margin: const EdgeInsets.only(left: 5, top: 5, right: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon ?? 'assets/images/profile_ico.svg',
              width: 25,
              height: 25,
            ),
            Expanded(
              child: TextField(
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: label ?? 'Enter your name',
                  labelStyle: const TextStyle(color: Colors.black54, fontSize: 14),
                  floatingLabelStyle: const TextStyle(color: Colors.black54, fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                ),
                cursorColor: Colors.white60,
              ),
            ),
          ],
        ));
  }
}
