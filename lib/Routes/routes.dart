

import 'package:flutter/cupertino.dart';
import 'package:metro_pay/ui/screens/fund_balance/fund_balance.dart';
import 'package:metro_pay/ui/screens/my_qr_code/my_qr_code.dart';
import 'package:metro_pay/ui/screens/notifications/notifications.dart';
import 'package:metro_pay/ui/screens/profile/profile.dart';
import 'package:metro_pay/ui/screens/receive_money/receive_money.dart';
import 'package:metro_pay/ui/screens/scan_to_pay/scan_to_pay.dart';
import 'package:metro_pay/ui/screens/send_money/send_money.dart';
import 'package:metro_pay/ui/screens/withdraw/withdraw.dart';
import 'package:metro_pay/ui/screens/withdrawal_account/withdraw_account.dart';

import '../ui/screens/app_navigation/app_navigation.dart';
import '../ui/screens/app_navigation/home/home.dart';
import '../ui/screens/scan_to_pay/send_money_confirm.dart';
import '../ui/screens/send_money/receipients.dart';
import '../ui/screens/withdraw/withdraw_amount.dart';
import '../ui/screens/withdrawal_account/create_withdraw_account.dart';

class PageRoutes {
  static const String addThumbImpression = 'recent_orders_page';
  static const String homePage = 'home_page';
  static const String appNavigation = 'app_navigation';
  static const String sendMoney = 'sendMoney';
  static const String fundTransferAmount = 'fund_transfer_amount';
  static const String fundInterTransferAmount = 'fund_inter_transfer_amount';
  static const String fundTransferPin = 'fund_transfer_pin';
  static const String recipients = 'recipients';
  static const String myQrCode = 'myQrCode';
  static const String notifications = 'notifications';
  static const String profile = 'profile';
  static const String receiveMoney = 'receiveMoney';
  static const String scanToPay = 'scanToPay';
  static const String fundBalance = 'fundBalance';
  static const String withdraw = 'withdraw';
  static const String withdrawAmount = 'withdrawAmount';
  static const String sendMoneyConfirmation = 'sendMoneyConfirmation';
  static const String pinTokenInput = 'pin_token_input';
  static const String withdrawalAccount = 'withdrawalAccount';
  static const String createWithdrawalAccount = 'createWithdrawalAccount';



  Map<String, WidgetBuilder> routes() {
    return {
      // addThumbImpression: (context) => const AssignThumbImpression(),
      homePage: (context) => const Home(),
      appNavigation: (context) => const AppNavigation(),
      sendMoney: (context) => const SendMoney(),
      // fundTransferAmount: (context) => const FundTransferAmount(),
      // fundInterTransferAmount: (context) => const FundInterTransferAmount(),
      // fundTransferPin: (context) => const FundTransferPin(),
      recipients: (context) => const Recipients(),
      myQrCode: (context) => const MyQrCode(),
      notifications: (context) => const Notifications(),
      profile: (context) => const Profile(),
      receiveMoney: (context) => const ReceiveMoney(),
      scanToPay: (context) => const ScanToPay(),
      fundBalance: (context) => const FundBalance(),
      withdraw: (context) => const Withdraw(),
      withdrawAmount: (context) => const WithdrawAmount(),
      sendMoneyConfirmation: (context) => const SendMoneyConfirmation(),
      withdrawalAccount: (context) => const WithdrawAccount(),
      createWithdrawalAccount: (context) => const CreateWithdrawAccount(),

    };
  }
}
