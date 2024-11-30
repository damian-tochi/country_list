
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../Consts/global_func.dart';
import '../../Theme/colors.dart';
import '../../data/models/transaction_history.dart';


class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({
    super.key,
    required this.onTap,
    required this.transaction,
  });

  final Transaction transaction;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var isCredit = true;
    if (transaction.entryType == "CREDIT") {
      isCredit = true;
    } else {
      isCredit = false;
    }

    double value = double.tryParse(transaction.amount.toString()) ?? 0.0;
    String formattedValue = NumberFormat.currency(
      symbol: '',
      decimalDigits: 2,
    ).format(value);

    List<String> parts = formattedValue.split('.');

    String wholeNumber = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '00';



    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color: HexColor.fromHex("#FFFFFF"),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isCredit ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 41,
                                  height: 41,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: HexColor.fromHex("#E2F6F5"),
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/arrow-in.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            ) : Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 41,
                                  height: 41,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: HexColor.fromHex("#F6E2E2"),
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/arrow-out.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            ) ,
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  transaction.submittedByUsername.toString(),
                                  style: CustomTheme.label.copyWith(
                                    color: HexColor.fromHex('#040405'),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  transaction.transactionType.value.toString(),
                                  style: CustomTheme.label.copyWith(
                                    color: HexColor.fromHex('#66687E'),
                                    fontWeight: FontWeight.w100,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                isCredit ? RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      color: HexColor.fromHex('#040405'),
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '+ N$wholeNumber'),
                                      // Whole number part
                                      TextSpan(
                                          text: '.$decimalPart'),
                                    ],
                                  ),

                                ) :  RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      color: HexColor.fromHex('#040405'),
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '- N$wholeNumber'),
                                      // Whole number part
                                      TextSpan(
                                          text: '.$decimalPart'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('From',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                        color: HexColor.fromHex('#66687E'),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 4,
                                      height: 4,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(transaction.accountNo,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                        color: HexColor.fromHex('#66687E'),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
