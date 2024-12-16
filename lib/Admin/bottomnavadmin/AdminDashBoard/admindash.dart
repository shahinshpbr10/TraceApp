import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:traceapp/Admin/bottomnavadmin/AddTransactionpageAdmin/addtransactionpageadmin.dart';
import 'package:traceapp/Admin/bottomnavadmin/AdminDashBoard/widgets/admintrascationcard.dart';
import 'package:traceapp/Admin/bottomnavadmin/TransactionListPage/transitionlistingpage.dart';
import 'package:traceapp/Passenger/Common/appcolor.dart';
import 'package:traceapp/Passenger/Common/textstyles.dart';

import '../../../Passenger/Historypage/historypage.dart';
import 'widgets/chart.dart';

import 'widgets/constant.dart';

class Admindash extends StatefulWidget {
  const Admindash({super.key});

  @override
  State<Admindash> createState() => _AdmindashState();
}

class _AdmindashState extends State<Admindash> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: defaultPadding),
                Chart(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      TransactionCardAdmin(
                        iconPath: "assets/icons/fuel.svg",
                        title: "Sana Travels",
                        amount: 5000,
                        reason: "Fuel Charge",
                        date: "16 Dec 2024",
                      ),
                      TransactionCardAdmin(
                        iconPath: "assets/icons/ticket.svg",
                        title: "Sana AC Bus",
                        amount: 2500,
                        reason: "Passenger Collection",
                        date: "16 Dec 2024",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () { Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                              return AddTransactionPageAdmin();
                            },));},
                            child: Icon(Iconsax.add),

                          ),
                          ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.maincolor2)),
                              onPressed: () {
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                              return TransactionListPageAdmin();
                            },));
                              }, child: Text('See All',style: AppTextStyles.caption.copyWith(color: AppColors.white),))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
