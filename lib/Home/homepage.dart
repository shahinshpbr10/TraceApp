import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:traceapp/Common/appcolor.dart';
import 'package:traceapp/Common/textstyles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.maincolor1, AppColors.maincolor2],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(58),
                      bottomLeft: Radius.circular(58))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [CircleAvatar(),IconButton(onPressed:() {
                          
                        }, icon: Icon(Iconsax.notification,color: AppColors.appwhite,)),],),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Hello,\nShahinsh pbr",style: AppTextStyles.heading2.copyWith(color: AppColors.appwhite,fontSize:35 ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
