import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Consts/global_func.dart';
import '../../../Routes/routes.dart';
import '../../components/payment_options_card.dart';


class ReceiveMoney extends StatefulWidget {
  const ReceiveMoney({super.key});

  @override
  ReceiveMoneyState createState() => ReceiveMoneyState();
}

class ReceiveMoneyState extends State<ReceiveMoney> {

  final TextEditingController sumInputController = TextEditingController();

  late final List<String> imageUrls = [
    'assets/images/person1.png',
    'assets/images/person2.png',
    'assets/images/person3.png',
    'assets/images/person4.png',
    'assets/images/person5.png',
    'assets/images/person6.png',
  ];

  List<PaymentOption> optionsList = [
    PaymentOption('My QR Code', 'Share a QR code linked to your account'),
    PaymentOption('My Username', 'Share your username tag'),
    PaymentOption('My Payment Link', 'Share a payment link for account'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.sizeOf(context).height / 10;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF9F9F9),
              Color(0xFFF9F9F9),
            ],
          ),
        ),
        padding: EdgeInsets.only(
          top: topPadding,
        ),
        child: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.only(
                    left: screenWidth / 20, right: screenWidth / 20),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      const Align(
                        child: Text(
                          'Receive Money',
                          style: TextStyle(
                              color: Color(0xFF040405),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/images/arrow-left-black.svg',
                            width: 25.0,
                            height: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF9F9F9),
                  ),
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, right: 10, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 5,),

                                SvgPicture.asset(
                                  'assets/images/sum-input-money-ico.svg',
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 40,
                                    child: TextField(
                                      cursorColor: Colors.black45,
                                      decoration: InputDecoration(
                                        hintText: 'Set amount to receive',
                                        hintStyle: const TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black38),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,
                                        disabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        focusedErrorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(22),
                                            borderSide: const BorderSide(
                                                color: Colors.white)),
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 11.0, horizontal: 22.0),
                                      ),
                                      controller: sumInputController,
                                      onChanged: (searchText) {
                                        searchText = searchText.toLowerCase();
                                        setState(() {

                                        });
                                      },
                                      onTap: () {
                                        setState(() {


                                        });
                                      },
                                      onEditingComplete: () {
                                        setState(() {

                                        });
                                      },
                                    ),
                                  ),),

                                SvgPicture.asset(
                                  'assets/images/ban-edit-icon.svg',
                                  width: 20.0,
                                  height: 20.0,
                                ),

                                const SizedBox(width: 5,),

                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10,),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, right: 10, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Request Money',
                              style: TextStyle(
                                  color: Color(0xFF696969),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffF4F4F4),
                                borderRadius: BorderRadius.circular(60),
                              ),
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(top: 10, bottom: 25),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: Stack(
                                        children: List.generate(
                                            imageUrls.length, (index) {
                                          return Positioned(
                                              left: index * 35,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                  const Color(0xffFFFFFF),
                                                  borderRadius:
                                                  BorderRadius.circular(60),
                                                ),
                                                padding:
                                                const EdgeInsets.all(0.1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(50),
                                                  child: Image.asset(
                                                    imageUrls[index],
                                                    width: 60.0,
                                                    height: 60.0,
                                                  ),
                                                ),
                                              ));
                                        }),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, PageRoutes.recipients);
                                    },
                                    child: const Text(
                                      'See all',
                                      style: TextStyle(
                                          color: Color(0xFF040405),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/small-arrow-right.svg',
                                    width: 25.0,
                                    height: 25.0,
                                  ),
                                ],
                              ),
                            ),

                            const Text(
                              'Receive money through:',
                              style: TextStyle(
                                  color: Color(0xFF696969),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),

                            const SizedBox(height: 10,),

                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: optionsList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return PaymentOptionCard(
                                  device: optionsList[index],
                                  onTap: () {

                                  },
                                );
                              },
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
