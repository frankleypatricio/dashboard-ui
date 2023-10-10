import 'package:dashboard_ui/config.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartSample extends StatelessWidget {
  final _meses = {
    1: 'Jan', 2: 'Fev', 3: 'Mar', 4: 'Abr',
    5: 'Mai', 6: 'Jun', 7: 'Jul', 8: 'Ago',
    9: 'Set', 10: 'Out', 11: 'Nov', 12: 'Dez',
  };
  final _gradientColors = [
    Colors.cyanAccent,
    Colors.blueAccent,
  ];

  LineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 1, maxX: 12,
        minY: 0, maxY: 100,

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
        // -------------------------------

        // Labels que ficam em cada um dos 4 cantos
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) => SideTitleWidget(
                axisSide: meta.axisSide,
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
        ),
        // -------------------------------------------

        // Borda do gráfico
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d)),
        ),
        // ----------------------

        // Linhas do gráfico
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(1, 60),
              FlSpot(2, 35),
              FlSpot(3, 75),
              FlSpot(4, 43),
              FlSpot(5, 15),
              FlSpot(6, 23),
              FlSpot(7, 30),
              FlSpot(8, 46),
              FlSpot(9, 65),
              FlSpot(10, 80),
              FlSpot(11, 95),
              FlSpot(12, 77),
            ],
            isCurved: true,
            gradient: LinearGradient(
              colors: _gradientColors,
            ),
            barWidth: 5,
            dotData: const FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: _gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ),
        ],
        // -----------------------------------
      ),
    );
  }

/*Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }*/
}