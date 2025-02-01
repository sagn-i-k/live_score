import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/color_manager.dart';

class CustomGraphComponent extends StatelessWidget {
  final RxList<FlSpot> graphData;

  const CustomGraphComponent({Key? key, required this.graphData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Obx(
            () => LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Color(0xFF4A4A4A).withOpacity(0.2),
                  strokeWidth: 0.5, // Line width
                  dashArray: [3, 3], // Dotted line
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Color(0xFF4A4A4A).withOpacity(0.2), // Grid line color
                  strokeWidth: 0.5, // Line width
                  dashArray: [3, 3], // Dotted line
                );
              },
            ),
            titlesData: FlTitlesData(
              rightTitles:AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Hide Y-axis titles and numbers
                  reservedSize: 0,   // Don't reserve space for Y-axis
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Hide Y-axis titles and numbers
                  reservedSize: 0,   // Don't reserve space for Y-axis
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Hide Y-axis titles and numbers
                  reservedSize: 0,   // Don't reserve space for Y-axis
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Hide X-axis titles and numbers
                  reservedSize: 0,   // Don't reserve space for X-axis
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: graphData,
                isCurved: true,
                color: ColorManager.analyticColor,
                barWidth: 3,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
                dotData: FlDotData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
