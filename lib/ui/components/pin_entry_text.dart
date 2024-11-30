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
          right: MediaQuery.of(context).size.width / 8,
          left: MediaQuery.of(context).size.width / 8),
      child: SizedBox(

        child: PinCodeTextField(
          length: 4,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          obscureText: true,
          blinkWhenObscuring: true,
          animationType: AnimationType.slide,
          textStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(15),
            fieldHeight: 65,
            fieldWidth: 65,
            borderWidth: 1,
            selectedFillColor: HexColor.fromHex("#F4F4F4"),
            activeFillColor: HexColor.fromHex("#F4F4F4"),
            inactiveFillColor: HexColor.fromHex("#F4F4F4"),
            inactiveColor: HexColor.fromHex("#F4F4F4"),
            activeColor: HexColor.fromHex("#F4F4F4"),
            selectedColor: HexColor.fromHex("#F4F4F4"),
          ),
          cursorColor: HexColor.fromHex("#D7DBDD"),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.white,
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