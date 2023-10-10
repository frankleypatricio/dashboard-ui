import 'package:dashboard_ui/config.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartSample extends StatefulWidget {
  const BarChartSample({super.key});

  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  final _meses = {
    0: 'Jan', 1: 'Fev', 2: 'Mar', 3: 'Abr',
    4: 'Mai', 5: 'Jun', 6: 'Jul', 7: 'Ago',
    8: 'Set', 9: 'Out', 10: 'Nov', 11: 'Dez',
  };

  final Color leftBarColor = Colors.yellow;
  final Color rightBarColor = Colors.red;
  final Color avgColor = Colors.orange;

  late final List<BarChartGroupData> _rawBarGroups;
  late List<BarChartGroupData> _showingBarGroups;
  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    _rawBarGroups = [
      _buildGroupData(0, 25, 0),
      _buildGroupData(1, 30, 0),
      _buildGroupData(2, 45, 8),
      _buildGroupData(3, 23, 15),
      _buildGroupData(4, 10, 45),
      _buildGroupData(5, 0, 64),
      _buildGroupData(6, 40, 10),
      _buildGroupData(7, 62, 1),
      _buildGroupData(8, 35, 24),
      _buildGroupData(9, 75, 5),
      _buildGroupData(10, 96, 27),
      _buildGroupData(11, 81, 53),
    ];
    _showingBarGroups = _rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 100,
        barGroups: _showingBarGroups,

        // Grid de plano de fundo
        gridData: FlGridData(
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.redAccent.withOpacity(.6),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.redAccent.withOpacity(.6),
              strokeWidth: 1,
            );
          },
        ),
        // ----------------------------

        // Evento de toque
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.grey,
            getTooltipItem: (a, b, c, d) => null,
          ),
          touchCallback: (FlTouchEvent event, response) {
            if (response == null || response.spot == null) {
              setState(() {
                touchedGroupIndex = -1;
                _showingBarGroups = List.of(_rawBarGroups);
              });
              return;
            }

            touchedGroupIndex = response.spot!.touchedBarGroupIndex;

            setState(() {
              if (!event.isInterestedForInteractions) {
                touchedGroupIndex = -1;
                _showingBarGroups = List.of(_rawBarGroups);
                return;
              }
              _showingBarGroups = List.of(_rawBarGroups);
              if (touchedGroupIndex != -1) {
                var sum = 0.0;
                for (final rod
                in _showingBarGroups[touchedGroupIndex].barRods) {
                  sum += rod.toY;
                }
                final avg = sum /
                    _showingBarGroups[touchedGroupIndex]
                        .barRods
                        .length;

                _showingBarGroups[touchedGroupIndex] =
                    _showingBarGroups[touchedGroupIndex].copyWith(
                      barRods: _showingBarGroups[touchedGroupIndex]
                          .barRods
                          .map((rod) {
                        return rod.copyWith(
                            toY: avg, color: avgColor);
                      }).toList(),
                    );
              }
            });
          },
        ),
        // ----------------------

        // Labels que ficam em cada um dos 4 cantos
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
              getTitlesWidget: (value, meta) => SideTitleWidget(
                axisSide: meta.axisSide,
                //space: 16, // margin
                child: Text(
                  _meses[value.toInt()]!,
                  style: TextStyle(
                    color: const Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: AppConfig.isDesktop ? 14 : 12,
                  ),
                ),
              ),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              getTitlesWidget: _buildLeftTitles,
            ),
          ),
        ),
        // -----------------------------------------

        // Borda do gráfico
        borderData: FlBorderData(show: false),
        // ----------------------
      ),
    );
  }

  Widget _buildLeftTitles(double value, TitleMeta meta) {
    String text;
    switch(value) {
      case 0: text = '0';
      case 20: text = '20';
      case 40: text = '40';
      case 60: text = '60';
      case 80: text = '80';
      case 100: text = '100';
      default: return const SizedBox();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(text, style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      )),
    );
  }

  BarChartGroupData _buildGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: 7,
        ),
        BarChartRodData(
          toY: y2,
          color: rightBarColor,
          width: 7,
        ),
      ],
    );
  }
}