import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/custom_piechart.dart';

class PieChartPage extends StatelessWidget {
  final bool isValueOnChart;
  const PieChartPage({required this.isValueOnChart, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Widget Testing',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: 
          CustomLinePieChart(
            isValueOnChart: isValueOnChart,
            totalLeaves: 12.0,
            totalPaidLeave: 4.0,
            height: 400,
            segments: [
              LineChartSegment(
                label: 'Sandwich',
                value: 2,
                color: const Color(0xFF08A4BB),
              ),
              LineChartSegment(
                label: 'Paid',
                value: 2,
                color: const Color(0xFFFF9FEC),
              ),
              LineChartSegment(
                label: 'Paid',
                value: 2,
                showShadow: false,
                color: const Color(0xFF2F648E),
              ),
              LineChartSegment(
                label: 'Unpaid',
                showShadow: false,
                value: 2,
                color: const Color(0xFF2FBBA4),
              ),
              LineChartSegment(
                label: 'Unpaid',
                value: 2,
                color: const Color(0xFF9FBE00),
              ),
              LineChartSegment(
                label: 'Holiday',
                value: 2,
                color: const Color(0xFFFDB913),
              ),
            ],
          ),
        ),
      ),
    );
}
