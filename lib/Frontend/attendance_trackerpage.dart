import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AttendanceTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Tracker'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: Colors.purple,
                            value: 40,
                            title: '40%',
                          ),
                          PieChartSectionData(
                            color: Colors.blue,
                            value: 30,
                            title: '30%',
                          ),
                          PieChartSectionData(
                            color: Colors.green,
                            value: 20,
                            title: '20%',
                          ),
                          PieChartSectionData(
                            color: Colors.lightBlueAccent,
                            value: 10,
                            title: '10%',
                          ),
                        ],
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'SE ${String.fromCharCode(65 + index)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
