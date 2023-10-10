import 'package:dashboard_ui/config.dart';
import 'package:dashboard_ui/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample extends StatefulWidget {
  const PieChartSample({super.key});

  @override
  State<PieChartSample> createState() => _PieChartSampleState();
}

class _PieChartSampleState extends State<PieChartSample> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PieChart(
          PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 70,
            startDegreeOffset: -90,

            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                  if(_touchedIndex != -1) {
                    setState(() => _touchedIndex = -1);
                  }

                } else {
                  int index = pieTouchResponse.touchedSection!.touchedSectionIndex;
                  if(_touchedIndex != index) {
                    setState(() => _touchedIndex = index);
                  }
                }
              },
            ),

            sections: [
              _buildSectionData(
                index: 0,
                value: 25,
                radius: 30,
                color: Colors.blue,
                titlePositionPercentageOffset: 1.6,
              ),
              _buildSectionData(
                index: 1,
                value: 20,
                radius: 27,
                color: Colors.cyanAccent,
                titlePositionPercentageOffset: 1.6,
              ),
              _buildSectionData(
                index: 2,
                value: 10,
                radius: 24,
                color: Colors.yellow,
                titlePositionPercentageOffset: 1.4,
              ),
              _buildSectionData(
                index: 3,
                value: 15,
                radius: 21,
                color: Colors.red,
                titlePositionPercentageOffset: 1.7,
              ),
              _buildSectionData(
                index: 4,
                value: 25,
                radius: 18,
                color: AppTheme.colorScheme.background,
                titlePositionPercentageOffset: 1.8,
              ),
            ],
          ),
        ),

        Column(
          children: [
            _buildIndicator(0, Colors.blue, 'Documentos'),
            _buildIndicator(1, Colors.cyanAccent, 'Media'),
            _buildIndicator(2, Colors.yellow, 'Pastas'),
            _buildIndicator(3, Colors.red, 'Outros'),
            _buildIndicator(4, AppTheme.colorScheme.background, 'Espaço Livre'),
          ],
        ),

        const Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('29.1', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
              Text('de 128GB'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator(int chartIndex, Color color, String text) {
    final size = AppConfig.isDesktop ? 14.0 : 12.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: size, height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: _touchedIndex != chartIndex
                  ? AppTheme.colorScheme.onSecondary.withOpacity(.4)
                  : AppTheme.colorScheme.onSecondary,
            ),
          )
        ],
      )
    );
  }

  PieChartSectionData _buildSectionData({
    required int index,
    required double value,
    required double radius,
    required Color color,
    required double titlePositionPercentageOffset,
  }) {
    return PieChartSectionData(
      value: value,
      color: color,
      titlePositionPercentageOffset: titlePositionPercentageOffset,
      radius: _touchedIndex != index ? radius : radius+5,
    );
  }
}