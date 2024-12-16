import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:traceapp/Admin/bottomnavadmin/AdminDashBoard/admindash.dart';
import 'package:traceapp/Admin/bottomnavadmin/addworkerpage.dart';
import 'package:traceapp/Admin/bottomnavadmin/widgets/buscard.dart';
import 'package:traceapp/Admin/bottomnavadmin/widgets/workercard.dart';
import 'package:traceapp/Admin/bottomnavadmin/workeslistingpage.dart';

import '../../../Passenger/Common/appcolor.dart';
import '../../../Passenger/Common/textstyles.dart';
import '../AddTransactionpageAdmin/addtransactionpageadmin.dart';
import '../TransactionListPage/transitionlistingpage.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.maincolor1, AppColors.maincolor2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.menu, color: Colors.black),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150', // Replace with actual profile image URL
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Hello,\nShahinsh Pbr',
                    style: AppTextStyles.bodyText
                        .copyWith(color: AppColors.white, fontSize: 26),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text(
                "Revenu Details",
                style: AppTextStyles.bodyText.copyWith(fontSize: 20),
              ),
            ),
            Admindash(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text(
                "Available bus",
                style: AppTextStyles.bodyText.copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(decoration: BoxDecoration(color: AppColors.black.withOpacity(0.1),borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                                    children: [
                    buildBusCard("PTB", "MLTR-CAL", "Kl50 Q 5252"),
                    buildBusCard("Sana Travels", "PLKD-MLTR", "Kl25 F 2235"),
                    SizedBox(height:20 ,),
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
                    )
                                    ],
                                  ),
                  )),
            ),Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text(
                "Available Workers",
                style: AppTextStyles.bodyText.copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(decoration: BoxDecoration(color: AppColors.black.withOpacity(0.1),borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                       buildWorkerCard("Shamil", "Driver"),
                        buildWorkerCard("Rahul", "Conductor"),

                        SizedBox(height:20 ,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () { Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                                return AddWorkerPage();
                              },));},
                              child: Icon(Iconsax.add),

                            ),
                            ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.maincolor2)),
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                                    return WorkerListingPage();
                                  },));
                                }, child: Text('See All',style: AppTextStyles.caption.copyWith(color: AppColors.white),))
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
