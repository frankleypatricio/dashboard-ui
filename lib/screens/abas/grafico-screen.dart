import 'package:dashboard_ui/components/charts/bar-chart.dart';
import 'package:dashboard_ui/components/charts/chart-base.dart';
import 'package:dashboard_ui/components/charts/line-chart.dart';
import 'package:dashboard_ui/components/charts/pie-chart.dart';
import 'package:dashboard_ui/components/charts/radar-chart.dart';
import 'package:dashboard_ui/components/responsive-layout.dart';
import 'package:dashboard_ui/config.dart';
import 'package:flutter/material.dart';

class GraficoScreen extends StatefulWidget {
  const GraficoScreen({super.key});

  @override
  State<GraficoScreen> createState() => _GraficoScreenState();
}

class _GraficoScreenState extends State<GraficoScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12), // bottom e right já está sendo definido dentro dos Gráficos
      child: LayoutBuilder(builder: (context, constraints) {
        return ResponsiveLayout(
          desktop: _buildDesktopTablet(constraints),
          tablet: _buildDesktopTablet(constraints),
          mobile: ListView(children: _buildCharts(constraints)),
        );
      }),
    );
  }

  Widget _buildDesktopTablet(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: _buildCharts(constraints),
      ),
    );
  }

  List<Widget> _buildCharts(BoxConstraints constraints) {
    return [
      ChartBase(
        title: 'Movimentação de arquivos',
        width: constraints.maxWidth / 2,
        height: constraints.maxHeight / 2,
        chart: LineChartSample(),
      ),
      ChartBase(
        title: 'Download e Upload',
        width: constraints.maxWidth / 2,
        height: constraints.maxHeight / 2,
        chart: const BarChartSample(),
      ),
      ChartBase(
        title: 'Armazenamento por Arquivo',
        width: constraints.maxWidth / 2,
        height: constraints.maxHeight / 2,
        chart: const PieChartSample(),
      ),
      ChartBase(
        title: 'Armazenamento por Database',
        width: constraints.maxWidth / 2,
        height: constraints.maxHeight / 2,
        chart: const RadarChartSample(),
      ),
    ];
  }
}