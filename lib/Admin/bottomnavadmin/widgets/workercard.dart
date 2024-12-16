import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traceapp/Passenger/Common/textstyles.dart';

import '../../../Passenger/Common/appcolor.dart';

Widget buildWorkerCard(String workerName, String position) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container( decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.maincolor1),),
      child: ListTile(
        title: Text(workerName,style: AppTextStyles.bodyText,),
        subtitle: Text(position,style: AppTextStyles.caption),
        trailing: Icon(Icons.person),
      ),
    ),
  );
}