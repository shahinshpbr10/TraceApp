import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:traceapp/Passenger/getstarted/getstarted2.dart';


import '../Common/appcolor.dart';
import '../Common/textstyles.dart';

class Getstarted extends StatefulWidget {
  const Getstarted({super.key});

  @override
  State<Getstarted> createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.maincolor1, AppColors.maincolor2])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.appwhite.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                  ),
                  child: Center(
                      child: Image(
                        image: AssetImage('assets/Images/trace.png'),
                        width: 350,
                      )),
                ),
           SizedBox(height: 100,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Welcome to Trace',
                        style: AppTextStyles.heading1.copyWith(
                          color: AppColors.appwhite,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Safe, Seamless,\nand Smart Travel\nAwaits You!",
                        style: AppTextStyles.smallBodyText.copyWith(
                          fontSize: 35,
                          color: AppColors.appwhite.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SizedBox(height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) {
                            return Getstarted2();
                          },));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Get started",style: AppTextStyles.bodyText.copyWith(color: Colors.black),),
                            Icon(Iconsax.arrow_right_1,color: Colors.black,)
                          ],
                        )),
                  ),
                ),SizedBox(height: 20,)
              ],
            )),
      ),
    );
  }
}
