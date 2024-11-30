import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/consts/app_icons.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../Consts/global_func.dart';
import '../../../components/custom_home_tab.dart';
import '../../../components/empty_transactions.dart';
import '../../../components/recipients_card.dart';
import '../../send_money/receipients.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Recipient> dayList = [
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
  List<Recipient> weekList = [];
  List<Recipient> monthList = [];
  List<Recipient> yearList = [];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

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
            top: MediaQuery.sizeOf(context).height / 10,
          ),
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
                          AppIcons.eyeShow,
                          height: 13,
                          width: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                child: TabBar(
                  isScrollable: false,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3, color: Colors.black),
                    insets: EdgeInsets.symmetric(horizontal: 15.0),
                  ),
                  padding: EdgeInsets.zero,
                  dividerColor: Colors.white,
                  tabs: [
                    CustomHomeTab(
                      label: 'Today',
                      isSelected: _tabController?.index == 0,
                    ),
                    CustomHomeTab(
                      label: 'Week',
                      isSelected: _tabController?.index == 1,
                    ),
                    CustomHomeTab(
                      label: 'Month',
                      isSelected: _tabController?.index == 2,
                    ),
                    CustomHomeTab(
                      label: 'Year',
                      isSelected: _tabController?.index == 3,
                    ),
                  ],
                  onTap: (index) {
                    setState(() {});
                  },
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                height: (itemWidth / 2) + 20,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 1,
                  ),
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(1),
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Spent',
                              style: TextStyle(
                                  color: Color(0xFF686A70), fontSize: 12),
                            ),
                            Text(
                              'Total Received',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ));
                  },
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Transactions History",
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
                              )),
                        ],
                      ),
                      // Expanded(
                      //   child: optionsList.isNotEmpty
                      //       ? ListView.builder(
                      //           scrollDirection: Axis.vertical,
                      //           itemCount: optionsList.length,
                      //           shrinkWrap: true,
                      //           padding: EdgeInsets.zero,
                      //           itemBuilder: (context, index) {
                      //             return RecipientsCard(
                      //               device: optionsList[index],
                      //               onTap: () {},
                      //             );
                      //           },
                      //         )
                      //       : Container(),
                      // ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Scaffold(
                                body: SingleChildScrollView(
                                    child: dailyTransactions())),
                            Scaffold(
                                body: SingleChildScrollView(
                                    child: weeklyTransactions())),
                            Scaffold(
                                body: SingleChildScrollView(
                                    child: monthlyTransactions())),
                            Scaffold(
                                body: SingleChildScrollView(
                                    child: yearlyTransactions())),
                          ],
                        ),
                      )
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

  Widget dailyTransactions() {
    return Container(
      child: dayList.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: dayList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return RecipientsCard(
                  device: dayList[index],
                  onTap: () {},
                );
              },
            )
          : EmptyTransactions(MediaQuery.of(context).size.height),
    );
  }

  Widget weeklyTransactions() {
    return Container(
      child: weekList.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: weekList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return RecipientsCard(
                  device: weekList[index],
                  onTap: () {},
                );
              },
            )
          : EmptyTransactions(MediaQuery.of(context).size.height),
    );
  }

  Widget monthlyTransactions() {
    return Container(
      child: monthList.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: monthList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return RecipientsCard(
                  device: monthList[index],
                  onTap: () {},
                );
              },
            )
          : EmptyTransactions(MediaQuery.of(context).size.height),
    );
  }

  Widget yearlyTransactions() {
    return Container(
      child: yearList.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: yearList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return RecipientsCard(
                  device: yearList[index],
                  onTap: () {},
                );
              },
            )
          : EmptyTransactions(MediaQuery.of(context).size.height),
    );
  }
}
