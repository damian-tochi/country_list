library pin_entry_text_field;

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Consts/global_func.dart';
import '../../Theme/colors.dart';

class PinEntryTextField extends StatefulWidget {
  final TextEditingController pinController;
  final ValueChanged<String> onSubmit;

  const PinEntryTextField({super.key, required this.pinController,
        required this.onSubmit,
      });

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width / 15,
          left: MediaQuery.of(context).size.width / 15),
      child: SizedBox(
        child: PinCodeTextField(
          length: 6,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          obscureText: true,
          blinkWhenObscuring: true,
          animationType: AnimationType.slide,
          textStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(15),
            fieldHeight: MediaQuery.of(context).size.height / 13.5,
            fieldWidth: MediaQuery.of(context).size.width / 7.5,
            borderWidth: 1,
            selectedFillColor: const Color(0x8FCED2D9),
            activeFillColor: const Color(0x4FCED2D9),
            inactiveFillColor: const Color(0x5FCED2D9),
            inactiveColor: const Color(0x5FCED2D9),
            activeColor: const Color(0x4FCED2D9),
            selectedColor: const Color(0x8FCED2D9),
          ),
          cursorColor: HexColor.fromHex("#D7DBDD"),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          controller: widget.pinController,
          keyboardType: TextInputType.number,
          onCompleted: (v) {},
          onChanged: widget.onSubmit,
          appContext: context,
        ),
      ),
    );
  }
}