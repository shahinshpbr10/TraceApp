import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traceapp/Passenger/Common/appcolor.dart';
import 'package:traceapp/Passenger/Common/textstyles.dart';

Widget buildBusCard(String busName, String route, String number) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.maincolor1)),
      child: ListTile(
        title: Text(
          busName,
          style: AppTextStyles.bodyText,
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(route, style: AppTextStyles.smallBodyText),
            Text(
              number,
              style: AppTextStyles.caption,
            ),
          ],
        ),
        trailing: Image(
          image: AssetImage('assets/Images/busone.png'),
          width: 50,
        ),
      ),
    ),
  );
}
