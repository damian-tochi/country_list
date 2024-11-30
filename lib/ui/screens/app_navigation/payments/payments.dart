import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Consts/global_func.dart';
import '../../../../Routes/routes.dart';
import '../../../components/recipients_card.dart';
import '../../send_money/receipients.dart';
import '../home/home.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode submitBtnNode = FocusNode();

  List<Items> items = [
    Items("Scan to Pay", "assets/images/scan-qr.svg", PageRoutes.scanToPay),
    Items(
        "Send Money", "assets/images/money-send-cam.svg", PageRoutes.sendMoney),
    Items("Fund Balance", "assets/images/money-recive.svg",
        PageRoutes.fundBalance),
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
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                GlobalFunc.stringToMaterialColor("#BAE5A400"),
                const Color(0x4FBAE5A4),
              ],
            ),
          ),
          padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height / 10, left: 20, right: 20),
          child: Column(
            children: [
              const Align(
                child: Text("Balance",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF696969),
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "₦832,500",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF040405),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const Text(
                      ".50",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0x4F000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.all(7),
                        child: SvgPicture.asset(
                          'assets/images/eye_ico.svg',
                          height: 13,
                          width: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: (itemWidth / 1.4) + 20,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 6 / 5.1, // Ensures each child is a square
                  ),
                  itemCount: items.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(1),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, items[index].route);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                items[index].image,
                                height: 29,
                                width: 29,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                items[index].name,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Select a bill to pay:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0x4F000000),
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),

                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "See all",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF040405),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            )
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
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
