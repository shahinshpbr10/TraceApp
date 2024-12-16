import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:traceapp/Common/appcolor.dart';
import 'package:traceapp/Common/textstyles.dart';

class TransactionListingPage extends StatefulWidget {
  const TransactionListingPage({super.key});

  @override
  State<TransactionListingPage> createState() => _TransactionListingPageState();
}

class _TransactionListingPageState extends State<TransactionListingPage> {
  // Sample transaction data
  final List<Map<String, dynamic>> transactions = [
    {
      'busName': 'Sana Travels',
      'amount': 120.50,
      'date': '2024-07-26',
      'status': 'Completed',
    },
    {
      'busName': 'Metro Bus',
      'amount': 75.00,
      'date': '2024-07-25',
      'status': 'Pending',
    },
    {
      'busName': 'Green Line',
      'amount': 100.00,
      'date': '2024-07-24',
      'status': 'Failed',
    },
    {
      'busName': 'City Express',
      'amount': 90.00,
      'date': '2024-07-23',
      'status': 'Completed',
    },
  ];

  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredTransactions = transactions.where((transaction) {
      if (selectedFilter == 'All') return true;
      return transaction['status'] == selectedFilter;
    }).toList();

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Text(
          'Transactions',
          style: AppTextStyles.bodyText.copyWith(fontSize: 20),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Filter Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterChipWidget(
                  title: 'All',
                  isSelected: selectedFilter == 'All',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'All';
                    });
                  },
                ),
                FilterChipWidget(
                  title: 'Completed',
                  isSelected: selectedFilter == 'Completed',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Completed';
                    });
                  },
                ),
                FilterChipWidget(
                  title: 'Pending',
                  isSelected: selectedFilter == 'Pending',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Pending';
                    });
                  },
                ),
                FilterChipWidget(
                  title: 'Failed',
                  isSelected: selectedFilter == 'Failed',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Failed';
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Transaction List
          Expanded(
            child: ListView.builder(
              itemCount: filteredTransactions.length,
              itemBuilder: (context, index) {
                final transaction = filteredTransactions[index];
                return TransactionCard(
                  busName: transaction['busName'],
                  amount: transaction['amount'],
                  date: transaction['date'],
                  status: transaction['status'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Filter Chip Widget
class FilterChipWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black87 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.bodyText.copyWith(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Transaction Card Widget
class TransactionCard extends StatelessWidget {
  final String busName;
  final double amount;
  final String date;
  final String status;

  const TransactionCard({
    Key? key,
    required this.busName,
    required this.amount,
    required this.date,
    required this.status,
  }) : super(key: key);

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Completed':
        return Iconsax.check;
      case 'Pending':
        return Iconsax.timer;
      case 'Failed':
        return Iconsax.close_circle;
      default:
        return Iconsax.info_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),


      decoration: BoxDecoration(color: AppColors.black.withOpacity(0.05),borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(status).withOpacity(0.2),
          child: Icon(
            _getStatusIcon(status),
            color: _getStatusColor(status),
          ),
        ),
        title: Text(
          busName,
          style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          'Date: $date',
          style: AppTextStyles.caption.copyWith(color: Colors.grey.shade600, fontSize: 12),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$${amount.toStringAsFixed(2)}',
              style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 4),
            Text(
              status,
              style: AppTextStyles.caption.copyWith(
                color: _getStatusColor(status),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
