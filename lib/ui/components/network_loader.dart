import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../Theme/colors.dart';

class NetworkLoader extends StatelessWidget {
  const NetworkLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(color: CustomTheme.transparentBlack),
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitChasingDots(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.orange : Colors.red,
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
