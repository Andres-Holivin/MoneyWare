import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../components/header.dart';
import '../components/nav_bar.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        body: SafeArea(child: Text("hello")
            //     LineChart(LineChartData(
            //   lineTouchData: LineTouchData(enabled: true),
            //   lineBarsData: [
            //     LineChartBarData(
            //       spots: [
            //         FlSpot(0, 1),
            //         FlSpot(1, 1),
            //         FlSpot(2, 3),
            //         FlSpot(3, 4),
            //         FlSpot(3, 5),
            //         FlSpot(4, 4)
            //       ],
            //       isCurved: true,
            //       barWidth: 2,
            //       color: Colors.orange,
            //       belowBarData: BarAreaData(
            //         show: true,
            //         color: Colors.lightBlue.withOpacity(0.5),
            //       ),
            //       aboveBarData: BarAreaData(
            //         show: true,
            //         color: Colors.lightGreen.withOpacity(0.5),
            //       ),
            //       dotData: FlDotData(
            //         show: false,
            //       ),
            //     ),
            //   ],
            //   minY: 0,
            //   titlesData: FlTitlesData(
            //     bottomTitles: AxisTitles(
            //         sideTitles: SideTitles(reservedSize: 6, showTitles: true)),
            //     leftTitles: AxisTitles(
            //         sideTitles: SideTitles(reservedSize: 6, showTitles: true)),
            //   ),
            //   gridData: FlGridData(
            //     show: true,
            //     checkToShowHorizontalLine: (double value) {
            //       return value == 1 || value == 2 || value == 3 || value == 4;
            //     },
            //   ),
            // ))
            ));
  }
}
