import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Consts/global_func.dart';


class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  NotificationsState createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.23),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  GlobalFunc.stringToMaterialColor("#E8E2F5"),
                  GlobalFunc.stringToMaterialColor("#FFFFFF"),
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.24,
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.099,),
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: SvgPicture.asset(
                                      'assets/arrow-left.svg',
                                      width: 25.0,
                                      height: 20.0,
                                    ),
                                  ),
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                        color: HexColor.fromHex('#040405'),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: 'Payments',
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                  color:  HexColor.fromHex('#040405'),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'Click on any of the options below',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),


              ],
            ),
          )),
    );
  }
}
