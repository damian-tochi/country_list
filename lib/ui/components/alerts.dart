import 'package:african_countries/consts/app_icons.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            color: Colors.green,
            border: const Border(
              left: BorderSide(
                color: Color(0xFF02AA63),
                width: 1,
              ),
              top: BorderSide(
                color: Color(0xFF02AA63),
                width: 1,
              ),
              bottom: BorderSide(
                color: Color(0xFF02AA63),
                width: 1,
              ),
              right: BorderSide(
                color: Color(0xFF02AA63),
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
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
              ),),
              SvgPicture.asset(
                AppIcons.closeIcon,
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
            border: const Border(
              left: BorderSide(
                color: Color(0xFF8048FF),
                width: 1,
              ),
              top: BorderSide(
                color: Color(0xFF8048FF),
                width: 1,
              ),
              bottom: BorderSide(
                color: Color(0xFF8048FF),
                width: 1,
              ),
              right: BorderSide(
                color: Color(0xFF8048FF),
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.infoCircle,
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
                      color: Color(0xFF000000),
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    maxLines: 1,
              ),),
              SvgPicture.asset(
                AppIcons.closeIcon,
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
            color: Color(0xFFF72727),
            border: const Border(
              left: BorderSide(
                color: Color(0xFFF72727),
                width: 1,
              ),
              top: BorderSide(
                color: Color(0xFFF72727),
                width: 1,
              ),
              bottom: BorderSide(
                color: Color(0xFFF72727),
                width: 1,
              ),
              right: BorderSide(
                color: Color(0xFFF72727),
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.infoCircle,
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
                AppIcons.closeIcon,
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
            border: const Border(
              left: BorderSide(
                color: Color(0xFFE68C00),
                width: 1,
              ),
              top: BorderSide(
                color: Color(0xFFE68C00),
                width: 1,
              ),
              bottom: BorderSide(
                color: Color(0xFFE68C00),
                width: 1,
              ),
              right: BorderSide(
                color: Color(0xFFE68C00),
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.infoCircle,
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
                      color: const Color(0xFF000000),
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    maxLines: 1,
              ),),
              SvgPicture.asset(
                AppIcons.closeIcon,
                width: 13,
                height: 13,
              ),
            ],
          )),
    ),
  );
}
