import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:traceapp/Passenger/Common/textstyles.dart';
import 'package:traceapp/Passenger/signinpage/signinpage.dart';
import 'package:traceapp/Passenger/signuppage/signuppage.dart';

import '../Common/appcolor.dart';



class Getstarted2 extends StatefulWidget {
  const Getstarted2({super.key});

  @override
  State<Getstarted2> createState() => _Getstarted2State();
}

class _Getstarted2State extends State<Getstarted2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).pop,
                      icon: Icon(
                        Iconsax.arrow_circle_left,
                        size: 35,
                        color: AppColors.appwhite,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Get started",
                    style: AppTextStyles.heading2
                        .copyWith(color: AppColors.appwhite),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Open the\nWorld of Travel",
                  style: AppTextStyles.smallBodyText
                      .copyWith(color: AppColors.appwhite, fontSize: 40)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                      return LoginPage();
                    },));
                  },
                  child: Text(
                    "Sign in",
                    style: AppTextStyles.bodyText
                        .copyWith(color: AppColors.appwhite, fontSize: 20),
                  ),
                  style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                          BorderSide(color: AppColors.appwhite))),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                      return SignUpPage();
                    },));
                  },
                  child: Text(
                    "Sign Up",
                    style: AppTextStyles.bodyText
                        .copyWith(color: AppColors.maincolor1, fontSize: 20),
                  ),
                  style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                          BorderSide(color: AppColors.appwhite))),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 10,
                    color: AppColors.appwhite,
                  ),
                ),
                Text(
                  "Or continue with",
                  style: AppTextStyles.smallBodyText
                      .copyWith(color: AppColors.appwhite),
                ),
                Expanded(
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    indent: 10,
                    endIndent: 20,
                    color: AppColors.appwhite,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/Images/googleicon.png'),
                        width: 30,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Continue with google",
                        style: AppTextStyles.bodyText.copyWith(
                            color: AppColors.maincolor1, fontSize: 20),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                          BorderSide(color: AppColors.appwhite))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
