import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Theme/colors.dart';

class AuthPasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final double? height;
  final ValueChanged<String>? onChanged;

  const AuthPasswordField({
    Key? key,
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.nextFocus,
    this.height,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AuthPasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<AuthPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 10),
        height: widget.height,
        color: Colors.white,
        margin: const EdgeInsets.only(left: 5, top: 5, right: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/lock_ico.svg',
              width: 20,
              height: 20,
            ),
            Expanded(
              child: TextField(
                onChanged: widget.onChanged,
                controller: widget.controller,
                style: const TextStyle(fontSize: 12),
                obscureText: _obscureText,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: widget.label,
                    labelStyle:
                        const TextStyle(color: Colors.black54, fontSize: 12),
                    floatingLabelStyle:
                        const TextStyle(color: Colors.black54, fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                    suffixIcon: SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText =
                                !_obscureText; // Toggle the obscure state
                          });
                        },
                        child: _obscureText
                            ? SvgPicture.asset(
                                'assets/images/eye_slash_ico.svg',
                                fit: BoxFit.fill, height: 20, width: 20,
                              )
                            : SvgPicture.asset(
                                'assets/images/eye_ico.svg',
                                fit: BoxFit.fill, height: 20, width: 20,
                              ),
                      ),
                    ),
                    suffixIconConstraints:
                        const BoxConstraints(maxHeight: 25, maxWidth: 25)),
                cursorColor: Colors.white60,
              ),
            ),
          ],
        ));
  }
}
