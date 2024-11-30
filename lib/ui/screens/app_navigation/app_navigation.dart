import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metro_pay/ui/screens/app_navigation/payments/payments.dart';
import 'package:metro_pay/ui/screens/app_navigation/settings/settings.dart';
import 'package:metro_pay/ui/screens/app_navigation/transactions/transactions.dart';

import '../../../Theme/colors.dart';
import 'home/home.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  AppNavigationState createState() => AppNavigationState();
}

class AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const Home(),
    const Payments(),
    const Transactions(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _buildBottomNavItem(
            icon: SvgPicture.asset(
              'assets/images/footer_icons/home-ico.svg',
              height: 34,
              width: 34,
            ),
            label: "Home",
            activeIcon: SvgPicture.asset(
              'assets/images/footer_icons/home-active.svg',
              height: 34,
              width: 34,
            ),
            isSelected: _currentIndex == 0,
          ),
          _buildBottomNavItem(
            icon: SvgPicture.asset(
              'assets/images/footer_icons/payment-ico.svg',
              height: 34,
              width: 34,
            ),
            label: "Payments",
            activeIcon: SvgPicture.asset(
              'assets/images/footer_icons/transaction-active.svg',
              height: 34,
              width: 34,
            ),
            isSelected: _currentIndex == 1,
          ),
          _buildBottomNavItem(
            icon: SvgPicture.asset(
              'assets/images/footer_icons/transaction-ico.svg',
              height: 34,
              width: 34,
            ),
            label: "Transactions",
            activeIcon: SvgPicture.asset(
              'assets/images/footer_icons/payment-active.svg',
              height: 34,
              width: 34,
            ),
            isSelected: _currentIndex == 2,
          ),
          _buildBottomNavItem(
            icon: SvgPicture.asset(
              'assets/images/footer_icons/setting-ico.svg',
              height: 34,
              width: 34,
            ),
            label: "Settings",
            activeIcon: SvgPicture.asset(
              'assets/images/footer_icons/setting-active.svg',
              height: 34,
              width: 34,
            ),
            isSelected: _currentIndex == 3,
          ),
        ],
        selectedLabelStyle: const TextStyle(color: Color(0xff01ED19)),
        selectedItemColor: const Color(0xff01ED19),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedLabelStyle: const TextStyle(color: Color(0xff788C6D)),
        selectedIconTheme: const IconThemeData(
          color: Color(0xff01ED19),
        ),
        unselectedItemColor: const Color(0xff788C6D),
        backgroundColor: const Color(0xff1D432E),
        showUnselectedLabels: true,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required SvgPicture icon,
    required String label,
    required SvgPicture activeIcon,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      label: label,
      backgroundColor: const Color(0xff1D432E),
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xff01ED19),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: isSelected ? activeIcon : icon,
          )
        ],
      ),
    );
  }
}
