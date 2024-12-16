import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traceapp/Passenger/Common/appcolor.dart';
import 'package:traceapp/Passenger/Common/textstyles.dart';
import 'constant.dart';


class TransactionCardAdmin extends StatelessWidget {
  const TransactionCardAdmin({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.amount,
    required this.reason,
    required this.date,
  }) : super(key: key);

  final String iconPath; // Path to the SVG icon
  final String title; // Transaction title (e.g., "Sana Travels")
  final double amount; // Amount involved in the transaction
  final String reason; // Reason for the transaction (e.g., "Fuel Charge")
  final String date; // Date of the transaction

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.maincolor1),
          borderRadius: BorderRadius.circular(8),


        ),
        child: Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold),
                  ),

                  Text(
                    reason,
                    style: AppTextStyles.smallBodyText.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: AppTextStyles.caption.copyWith(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Transaction Amount
            Text(
              "₹${amount.toStringAsFixed(2)}",
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.bold,
                color: amount >= 0 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
