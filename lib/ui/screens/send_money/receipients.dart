import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Consts/global_func.dart';
import '../../../Routes/routes.dart';
import '../../components/payment_options_card.dart';
import '../../components/recipients_card.dart';

class Recipient {
  String name;
  String accType;
  String img;

  Recipient(this.name, this.accType, this.img);
}

class Recipients extends StatefulWidget {
  const Recipients({super.key});

  @override
  RecipientsState createState() => RecipientsState();
}

class RecipientsState extends State<Recipients> {
  final TextEditingController searchInputController = TextEditingController();
  late final List<String> imageUrls = [
    'assets/images/person1.png',
    'assets/images/person2.png',
    'assets/images/person3.png',
    'assets/images/person4.png',
    'assets/images/person5.png',
    'assets/images/person6.png',
  ];

  List<Recipient> optionsList = [
    Recipient(
      'Scan to Pay',
      'Scan the recipient’s QR code',
      'assets/images/person1.png',
    ),
    Recipient(
      'Username',
      'Input the recipient’s username',
      'assets/images/person2.png',
    ),
    Recipient(
      'Payment Link',
      'Send via the recipient’s payment link',
      'assets/images/person2.png',
    ),
    Recipient('Bank Account', 'Send money to a bank account',
        'assets/images/person2.png'),
    Recipient('Bank Account', 'Send money to a bank account',
        'assets/images/person2.png'),
    Recipient('Bank Account', 'Send money to a bank account',
        'assets/images/person2.png'),
    Recipient('Bank Account', 'Send money to a bank account',
        'assets/images/person2.png'),
    Recipient('Bank Account', 'Send money to a bank account',
        'assets/images/person2.png'),
    Recipient('Bank Account', 'Send money to a bank account',
        'assets/images/person2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.sizeOf(context).height / 10;
    final itemWidth = screenWidth / 3;

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
                          'Recipients',
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
                                Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: TextField(
                                        cursorColor: Colors.black45,
                                        decoration: InputDecoration(
                                          hintText: 'Search Beneficiaries...',
                                          hintStyle: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Colors.black38),
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,
                                          prefixIcon: Icon(Icons.search),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(22),
                                              borderSide: const BorderSide(
                                                  color: Colors.black45)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(22),
                                              borderSide: const BorderSide(
                                                  color: Colors.black45)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(22),
                                              borderSide: const BorderSide(
                                                  color: Colors.black45)),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(22),
                                              borderSide: const BorderSide(
                                                  color: Colors.black45)),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(22),
                                              borderSide: const BorderSide(
                                                  color: Colors.black45)),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(22),
                                              borderSide: const BorderSide(
                                                  color: Colors.black45)),
                                          contentPadding: const EdgeInsets.symmetric(
                                              vertical: 11.0, horizontal: 22.0),
                                        ),
                                        controller: searchInputController,
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, right: 10, bottom: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: optionsList.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return RecipientsCard(
                                        device: optionsList[index],
                                        onTap: () {},
                                      );
                                    },
                                  ),

                              ],
                            ),
                          ),
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
