import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:traceapp/Passenger/getstarted/getstarted.dart';

import '../Common/appcolor.dart';
import '../Common/textstyles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  @override
  void initState() {
    super.initState();

    // Navigate to Get Started page after a 3-second delay
    Future.delayed(const Duration(seconds: 3), () {
      // Check if the widget is still mounted before using the context
      if (mounted) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => Getstarted()),
        );
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(

            gradient: LinearGradient(begin: Alignment.topLeft,
                end: Alignment.bottomRight ,
                colors: [AppColors.maincolor1, AppColors.maincolor2])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "TRACE",
              style: AppTextStyles.heading1.copyWith(color: AppColors.appwhite),
            )),
            Text(
              "Manage • Track • Travel",
              style: AppTextStyles.smallBodyText.copyWith(color: AppColors.appwhite),
            ),
            SizedBox(height: 90,),
            Lottie.asset('assets/lotties/busloading.json')
          ],
        ),
      ),
    );
  }
}
