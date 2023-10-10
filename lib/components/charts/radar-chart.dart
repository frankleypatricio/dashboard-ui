import 'package:dashboard_ui/config.dart';
import 'package:dashboard_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RadarChartSample extends StatefulWidget {
  const RadarChartSample({super.key});

  @override
  State<RadarChartSample> createState() => _RadarChartSampleState();
}

class _RadarChartSampleState extends State<RadarChartSample> {
  int _selectedDataSetIndex = -1;
  final _angleValue = 0.0;
  final _relativeAngleMode = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: RadarChart(
            RadarChartData(
              radarTouchData: RadarTouchData(
                touchCallback: (FlTouchEvent event, response) {
                  if (!event.isInterestedForInteractions) {
                    setState(() {
                      _selectedDataSetIndex = -1;
                    });
                    return;
                  }
                  setState(() {
                    _selectedDataSetIndex = response?.touchedSpot?.touchedDataSetIndex ?? -1;
                  });
                },
              ),
              dataSets: _showingDataSets(),
              radarBackgroundColor: Colors.transparent,
              borderData: FlBorderData(show: false),
              radarBorderData: const BorderSide(color: Colors.transparent),
              titlePositionPercentageOffset: 0.2,
              titleTextStyle: const TextStyle(color: Color(0xff7589a2), fontSize: 14),
              getTitle: (index, angle) {
                final usedAngle = _relativeAngleMode ? angle + _angleValue : _angleValue;
                switch (index) {
                  case 0:
                    return RadarChartTitle(
                      text: 'Espaço Usado',
                      angle: usedAngle,
                    );
                  case 1:
                    return RadarChartTitle(
                      text: 'Espaço Livre',
                      angle: usedAngle,
                    );
                  case 2:
                    return RadarChartTitle(
                      text: 'Taxa de Uso',
                      angle: usedAngle,
                    );
                  default:
                    return const RadarChartTitle(text: '');
                }
              },
              tickCount: 1,
              ticksTextStyle: const TextStyle(color: Colors.transparent, fontSize: 10),
              tickBorderData: const BorderSide(color: Colors.transparent),
              gridBorderData: const BorderSide(color: Color(0xff7589a2), width: 2),
            ),
            swapAnimationDuration: const Duration(milliseconds: 400),
          ),
        ),

        Column(
          children: [
            _buildIndicator(0, Colors.green, 'Documentos'),
            _buildIndicator(1, Colors.orange, 'Google Drive'),
            _buildIndicator(2, Colors.redAccent, 'MEGA'),
            _buildIndicator(3, Colors.white, 'Github'),
            _buildIndicator(4, Colors.blue, 'One Drive'),
            _buildIndicator(5, const Color(0xFF45ADE8), 'Steam'),
          ],
        ),
      ],
    );
  }

  List<RadarDataSet> _showingDataSets() {
    return _buildDataSets().asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isSelected = index == _selectedDataSetIndex
          ? true
          : _selectedDataSetIndex == -1
          ? true
          : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor: isSelected
            ? rawDataSet.color
            : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries: rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> _buildDataSets() {
    return [
      RawDataSet(
        title: 'Documentos',
        color: Colors.green,
        values: [500, 1500, 1100],
      ),
      RawDataSet(
        title: 'Google Drive',
        color: Colors.orange,
        values: [1520, 480, 1600],
      ),
      RawDataSet(
        title: 'MEGA',
        color: Colors.redAccent,
        values: [1100, 900, 200],
      ),
      RawDataSet(
        title: 'Github',
        color: Colors.white,
        values: [300, 1700, 900],
      ),
      RawDataSet(
        title: 'One Drive',
        color: Colors.blue,
        values: [2000, 0, 100],
      ),
      RawDataSet(
        title: 'Steam',
        color: const Color(0xFF45ADE8),
        values: [850, 1150, 750],
      ),
    ];
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
                color: _selectedDataSetIndex != chartIndex
                    ? AppTheme.colorScheme.onSecondary.withOpacity(.4)
                    : AppTheme.colorScheme.onSecondary,
              ),
            )
          ],
        )
    );
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}