import 'package:dashboard_ui/config.dart';
import 'package:dashboard_ui/screens/abas/grafico-screen.dart';
import 'package:dashboard_ui/screens/abas/home-screen.dart';
import 'package:dashboard_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late int _abaSelecionada = 0;
  final _abas = [
    const HomeScreen(),
    const GraficoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    AppConfig.updateScreenSize(context);

    return Scaffold(
      appBar: AppConfig.isMobile ? AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.user),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ) : null,

      drawer: AppConfig.isMobile ? Drawer(
        backgroundColor: AppTheme.colorScheme.secondary,
        child: ListView(
          children: [
            const DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Icon(Icons.apartment_rounded),
            ),
            _buildMenuItens(),
          ],
        ),
      ) : null,

      body: SafeArea(
        child: Row(
          children: [
            // -----------------------
            // MENU
            // -----------------------
            if(!AppConfig.isMobile) Expanded(
              child: ColoredBox(
                color: AppTheme.colorScheme.secondary,
                child: ListView(
                  children: [
                    LayoutBuilder(
                        builder: (_, constraints) {
                          return DrawerHeader(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            child: IconButton(
                              onPressed: () => setState(() => AppConfig.menuRecolhido = !AppConfig.menuRecolhido),
                              icon: const Icon(Icons.apartment_rounded),
                              // size: constraints.maxWidth*.3,
                            ),
                          );
                        }
                    ),
                    _buildMenuItens(),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: AppConfig.menuRecolhido ? (AppConfig.isDesktop ? 20 : 18) : 5,
              child: _abas[_abaSelecionada],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItens() {
    const padding = EdgeInsets.symmetric(vertical: 20);
    return Column(
      children: (AppConfig.isMobile || !AppConfig.menuRecolhido) ? [
        ListTile(
          onTap: () => setState(() => _abaSelecionada = 0),
          leading: const Icon(Icons.home_rounded),
          title: const Text('Home'),
        ),
        ListTile(
          onTap: () => setState(() => _abaSelecionada = 1),
          leading: const Icon(Icons.auto_graph_rounded),
          title: const Text('Gráficos'),
        ),
        ListTile(
          onTap: (){},
          leading: const Icon(Icons.settings_rounded),
          title: const Text('Preferências'),
        ),
        ListTile(
          onTap: (){},
          leading: const Icon(Icons.logout_rounded),
          title: const Text('Sair'),
        ),
      ] : [
        IconButton(
          onPressed: () => setState(() => _abaSelecionada = 0),
          tooltip: 'Home',
          padding: padding,
          icon: const Icon(Icons.home_rounded),
        ),
        IconButton(
          onPressed: () => setState(() => _abaSelecionada = 1),
          tooltip: 'Gráficos',
          padding: padding,
          icon: const Icon(Icons.auto_graph_rounded),
        ),
        IconButton(
          onPressed: (){},
          tooltip: 'Preferências',
          padding: padding,
          icon: const Icon(Icons.settings_rounded),
        ),
        IconButton(
          onPressed: (){},
          tooltip: 'Sair',
          padding: padding,
          icon: const Icon(Icons.logout_rounded),
        ),
      ],
    );
  }
}