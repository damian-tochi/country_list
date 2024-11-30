import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Consts/global_func.dart';
import '../../../../Routes/routes.dart';
import '../../../../consts/app_icons.dart';

class Items {
  String name;
  String image;
  String route;
  Items(this.name, this.image, this.route);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollInstruction = true;

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode submitBtnNode = FocusNode();

  List<Items> items = [
    Items("Scan to Pay", AppIcons.qrScan, PageRoutes.scanToPay),
    Items("Send Money", AppIcons.sendMoney, PageRoutes.sendMoney),
    Items("Fund Balance", AppIcons.receiveMoney, PageRoutes.fundBalance),
    Items("My QR Code", AppIcons.qrCode, PageRoutes.myQrCode),
    Items("Receive Money", AppIcons.fundAcc, PageRoutes.receiveMoney),
    Items("Withdraw", AppIcons.withdraw, PageRoutes.withdraw),
  ];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 10) {
        if (_showScrollInstruction) {
          setState(() {
            _showScrollInstruction = false;
          });
        }
      } else {
        if (!_showScrollInstruction) {
          setState(() {
            _showScrollInstruction = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.sizeOf(context).height / 10;
    final itemWidth = screenWidth / 3;

    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: screenWidth,
              height: screenHeight,
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
                  top: topPadding,
                  left: screenWidth / 20,
                  right: screenWidth / 20),
              child: SingleChildScrollView(
            controller: _scrollController,
            child: FadedSlideAnimation(
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight - (topPadding * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "@TomiOla",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF040405),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: SvgPicture.asset(AppIcons.copyText,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ],
                                )),
                            const Spacer(),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, PageRoutes.notifications);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(AppIcons.homeNotification,
                                  height: 13,
                                  width: 13,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: (){ },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffD3EDBA),
                                    borderRadius: BorderRadius.circular(40),
                                  ),),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Balance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                width: 15,
                              ),
                              InkWell(
                                onTap: (){ },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  padding: const EdgeInsets.all(13),
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
                        const Spacer(),
                        const Text(
                          "Hi Tomi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                        const Text(
                          "What do you want to do?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0x8F000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: (itemWidth / 1.4) * 2 + 20,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio:
                                  6 / 5.1, // Ensures each child is a square
                            ),
                            itemCount: items.length,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(1),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
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
                                        const SizedBox(height: 8,),
                                        Text(
                                          items[index].name,
                                          style: const TextStyle(color: Colors.black, fontSize: 12),
                                        ),
                                      ],)
                                ),
                              );
                            },
                          ),
                        ),

                        if (_showScrollInstruction)
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Text(
                                  'Scroll for more option',
                                  style: TextStyle(fontSize: 16, color: Colors.grey),
                                ),
                                Icon(Icons.arrow_downward, color: Colors.grey),
                              ],
                            ),
                      ],
                    ),
                  ),

                  //Other contents
                ],
              ),
            ),),
          ),

        ],
      ),
    );
  }
}
