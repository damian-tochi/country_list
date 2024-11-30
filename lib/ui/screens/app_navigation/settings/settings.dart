import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/ui/components/green_button.dart';
import '../../../../Consts/global_func.dart';
import '../../../../Routes/routes.dart';
import '../../../../Theme/colors.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_btn/loading_btn.dart';
import '../../../components/setting_item_clickable_card.dart';
import '../../../components/setting_item_switch_card.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              InkWell(
                onTap: (){ },
                child: Container(
                  height: 55,
                  width: 55,
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
              const SizedBox(
                height: 10,
              ),
              const Align(
                child: Text("Abiola Folashade",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF040405),
                        fontWeight: FontWeight.bold)),
              ),
              const Text(
                "Personal Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF696969),
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: screenWidth * 0.3, right: screenWidth * 0.3),
                child: GreenButton(
                  height: 52,
                  padding: 10,
                  label: 'View Profile',
                  onTap: () {},
                  textColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20, top: 7),
                      child: Column(
                        children: [
                          _hideBalance(),
                          _withdrawalAccount(),
                          _manageRecipients(),
                          _transactionLimit(),
                          _changePassword(),
                          _changeTransactionPin(),
                          _loginMethod(),
                          _approvalMethod(),
                          _loginNotification(),
                          _contactSupport(),
                          _logout()
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hideBalance() {
    return SettingItemSwitchCard(
      title: "Hide Balance",
      onChange: (value) {},
      stateValue: true,
    );
  }

  Widget _withdrawalAccount() {
    return SettingItemClickableCard(
      title: "Withdrawal Account",
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.withdrawalAccount);
      },
    );
  }

  Widget _manageRecipients() {
    return SettingItemClickableCard(
      title: "Manage Recipients",
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.withdrawalAccount);
      },
    );
  }

  Widget _transactionLimit() {
    return SettingItemClickableCard(
      title: "Transaction Limit",
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.withdrawalAccount);
      },
    );
  }

  Widget _changePassword() {
    return SettingItemClickableCard(
      title: "Change Password",
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.withdrawalAccount);
      },
    );
  }

  Widget _changeTransactionPin() {
    return SettingItemClickableCard(
      title: "Change Transaction PIN",
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.withdrawalAccount);
      },
    );
  }

  Widget _loginMethod() {
    return SettingItemClickableCard(
      title: "Login Method",
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.withdrawalAccount);
      },
    );
  }

  Widget _approvalMethod() {
    return SettingItemClickableCard(
      title: "Approval Method",
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.withdrawalAccount);
      },
    );
  }

  Widget _loginNotification() {
    return SettingItemSwitchCard(
      title: "Login Notification",
      onChange: (value) {},
      stateValue: false,
    );
  }

  Widget _contactSupport() {
    return SettingItemClickableCard(
      title: "Contact Support",
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.withdrawalAccount);
      },
    );
  }

  Widget _logout() {
    return SettingItemClickableCard(
      title: "Logout",
      onTap: () {
        confirmLogoutBottomSheet();
      },
    );
  }

  confirmLogoutBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: false,
        enableDrag: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
            width: double.maxFinite,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Log out?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                  color: HexColor.fromHex("#59616D"),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          )),

                      Container(
                          height: 60,
                          width: 60,
                          margin: const EdgeInsets.only(left: 25),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor.fromHex("#FC3737"),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: SvgPicture.asset(
                              'assets/logout_white.svg',
                              width: 30,
                              height: 30,
                              fit: BoxFit.fill,
                            ),
                          )
                      )

                    ],
                  ),

                  const SizedBox(
                    height: 1,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText('Are you sure? You would have to\nenter your information again to\naccess your account.',
                      style: CustomTheme.label.copyWith(
                        color: HexColor.fromHex('#040405'),
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                      ),
                    ),),

                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: LoadingBtn(
                      height: 65,
                      borderRadius: 8,
                      animate: true,
                      color:  HexColor.fromHex('#000000'),
                      width: MediaQuery.of(context).size.width,
                      loader: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Center(
                          child: SpinKitDoubleBounce(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: const Text('Yes, Continue', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                      onTap: (startLoading, stopLoading, btnState) async {
                        if (btnState == ButtonState.idle) {
                          startLoading();
                          clearSharedPreferences();
                          await Future.delayed(const Duration(seconds: 2));
                          stopLoading();
                          Phoenix.rebirth(context);
                        }
                      },
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
