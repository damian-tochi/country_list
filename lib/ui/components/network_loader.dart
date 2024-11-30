import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Theme/colors.dart';



class NetworkLoader extends StatelessWidget {
  const NetworkLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(color: CustomTheme.fullTransparent),
        child: const SizedBox(height: double.maxFinite, width: double.maxFinite,)
      ),
    );
  }

}
