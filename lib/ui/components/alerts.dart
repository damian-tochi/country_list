import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Consts/global_func.dart';
import '../../Theme/colors.dart';


greenSuccessAlert(String info, BuildContext context) {
  context.showFlash<bool>(
    barrierDismissible: true,
    duration: const Duration(seconds: 3),
    builder: (context, controller) => FlashBar(
      controller: controller,
      forwardAnimationCurve: Curves.easeInCirc,
      reverseAnimationCurve: Curves.bounceIn,
      position: FlashPosition.top,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(left: 20, right: 20),
      elevation: 0,
      backgroundColor: CustomTheme.fullTransparent,
      content: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: CustomTheme.lightGreen,
            border: Border(
              left: BorderSide(
                color: HexColor.fromHex('#02AA63'),
                width: 1,
              ),
              top: BorderSide(
                color: HexColor.fromHex('#02AA63'),
                width: 1,
              ),
              bottom: BorderSide(
                color: HexColor.fromHex('#02AA63'),
                width: 1,
              ),
              right: BorderSide(
                color: HexColor.fromHex('#02AA63'),
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/tick-circle.svg',
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                info,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: HexColor.fromHex("#000000"),
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    maxLines: 1,
              ),),
              SvgPicture.asset(
                'assets/close_ico.svg',
                width: 13,
                height: 13,
              ),
            ],
          )),
    ),
  );
}

purpleSystemAlert(String info, BuildContext context) {
  context.showFlash<bool>(
    barrierDismissible: true,
    duration: const Duration(seconds: 3),
    builder: (context, controller) => FlashBar(
      controller: controller,
      forwardAnimationCurve: Curves.easeInCirc,
      reverseAnimationCurve: Curves.bounceIn,
      position: FlashPosition.top,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(left: 20, right: 20),
      elevation: 0,
      backgroundColor: CustomTheme.fullTransparent,
      content: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: CustomTheme.lightPurple,
            border: Border(
              left: BorderSide(
                color: HexColor.fromHex('#8048FF'),
                width: 1,
              ),
              top: BorderSide(
                color: HexColor.fromHex('#8048FF'),
                width: 1,
              ),
              bottom: BorderSide(
                color: HexColor.fromHex('#8048FF'),
                width: 1,
              ),
              right: BorderSide(
                color: HexColor.fromHex('#8048FF'),
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/info_circle_purple.svg',
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                info,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: HexColor.fromHex("#000000"),
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    maxLines: 1,
              ),),
              SvgPicture.asset(
                'assets/close_ico.svg',
                width: 14,
                height: 14,
              ),
            ],
          )),
    ),
  );
}

redFailedAlert(String info, BuildContext context) {
  context.showFlash<bool>(
    barrierDismissible: true,
    duration: const Duration(seconds: 3),
    builder: (context, controller) => FlashBar(
      controller: controller,
      forwardAnimationCurve: Curves.easeInCirc,
      reverseAnimationCurve: Curves.bounceIn,
      position: FlashPosition.top,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(left: 20, right: 20),
      elevation: 0,
      backgroundColor: CustomTheme.fullTransparent,
      content: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: HexColor.fromHex('#F72727'),
            border: Border(
              left: BorderSide(
                color: HexColor.fromHex('#F72727'),
                width: 1,
              ),
              top: BorderSide(
                color: HexColor.fromHex('#F72727'),
                width: 1,
              ),
              bottom: BorderSide(
                color: HexColor.fromHex('#F72727'),
                width: 1,
              ),
              right: BorderSide(
                color: HexColor.fromHex('#F72727'),
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/info_circle_red.svg',
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  info,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                  maxLines: 1,
                ),
              ),
              SvgPicture.asset(
                'assets/close_ico.svg',
                width: 13,
                height: 13,
              ),
            ],
          )),
    ),
  );
}

yellowWarningAlerts(String info, BuildContext context) {
  context.showFlash<bool>(
    barrierDismissible: true,
    duration: const Duration(seconds: 3),
    builder: (context, controller) => FlashBar(
      controller: controller,
      forwardAnimationCurve: Curves.easeInCirc,
      reverseAnimationCurve: Curves.bounceIn,
      position: FlashPosition.top,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(left: 20, right: 20),
      elevation: 0,
      backgroundColor: CustomTheme.fullTransparent,
      content: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: CustomTheme.lightYellow,
            border: Border(
              left: BorderSide(
                color: HexColor.fromHex('#E68C00'),
                width: 1,
              ),
              top: BorderSide(
                color: HexColor.fromHex('#E68C00'),
                width: 1,
              ),
              bottom: BorderSide(
                color: HexColor.fromHex('#E68C00'),
                width: 1,
              ),
              right: BorderSide(
                color: HexColor.fromHex('#E68C00'),
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/danger.svg',
                width: 30,
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                info,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: HexColor.fromHex("#000000"),
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    maxLines: 1,
              ),),
              SvgPicture.asset(
                'assets/close_ico.svg',
                width: 13,
                height: 13,
              ),
            ],
          )),
    ),
  );
}
