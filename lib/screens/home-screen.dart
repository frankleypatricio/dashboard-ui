import 'package:dashboard_ui/components/folder-container.dart';
import 'package:dashboard_ui/components/responsive-layout.dart';
import 'package:dashboard_ui/config.dart';
import 'package:dashboard_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ResponsiveLayout(
          mobile: Text('Mobile'),
          desktop: Text('Desktop'),
          tablet: Text('Tablet'),
        ),
      ),

      body: SafeArea(
        child: Row(
          children: [
            // -----------------------
            // MENU
            // -----------------------
            Expanded(
              child: ColoredBox(
                color: AppTheme.colorScheme.secondary,
                child: Column(
                  children: [
                    LayoutBuilder(
                      builder: (_, constraints) {
                        return DrawerHeader(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.apartment_rounded,
                            size: constraints.maxWidth*.3,
                          ),
                        );
                      }
                    ),
                    ResponsiveLayout(
                      desktop: Column(
                        children: [
                          ListTile(
                            onTap: (){},
                            leading: const Icon(Icons.home_rounded),
                            title: const Text('Home'),
                          ),
                          ListTile(
                            onTap: (){},
                            leading: const Icon(Icons.logout_rounded),
                            title: const Text('Sair'),
                          ),
                        ],
                      ),

                      mobile: Column(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.home_rounded),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.logout_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // -----------------------
            // BODY
            // -----------------------
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  children: [
                    LayoutBuilder(
                      builder: (_, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Dashboard', style: AppTheme.themeData.textTheme.titleLarge),
                            SizedBox(
                              width: constraints.maxWidth*.4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Pesquisar',
                                  suffixIcon: IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.search_rounded),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Meus arquivos', style: AppTheme.themeData.textTheme.titleMedium),
                        ElevatedButton.icon(
                          onPressed: (){},
                          icon: const Icon(Icons.add_rounded),
                          label: const Text('Adicionar'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Builder(
                      builder: (_) {
                        const size = 150.0;
                        final scrollController = ScrollController();
                        return Scrollbar(
                          controller: scrollController,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FolderContainer(
                                  size: size,
                                  icon: Icons.description_rounded,
                                  color: Colors.green,
                                  title: 'Documentos',
                                  totalFiles: 500,
                                  totalSpace: 2,
                                ),

                                FolderContainer(
                                  size: size,
                                  icon: FontAwesomeIcons.googleDrive,
                                  color: Colors.orange,
                                  title: 'Google Drive',
                                  totalFiles: 1520,
                                  totalSpace: 10.6,
                                ),

                                FolderContainer(
                                  size: size,
                                  icon: FontAwesomeIcons.database,
                                  color: Colors.redAccent,
                                  title: 'MEGA',
                                  totalFiles: 1100,
                                  totalSpace: 6,
                                ),

                                FolderContainer(
                                  size: size,
                                  icon: FontAwesomeIcons.github,
                                  color: Colors.white,
                                  title: 'Github',
                                  totalFiles: 300,
                                  totalSpace: 1.2,
                                ),

                                FolderContainer(
                                  size: size,
                                  icon: Icons.cloud_rounded,
                                  color: Colors.blue,
                                  title: 'One Drive',
                                  totalFiles: 2000,
                                  totalSpace: 20,
                                ),

                                FolderContainer(
                                  size: size,
                                  icon: FontAwesomeIcons.steam,
                                  color: Color(0xFF45ADE8),
                                  title: 'Steam',
                                  totalFiles: 850,
                                  totalSpace: 300.5,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),

            // -----------------------
            // ASIDE
            // -----------------------
            Expanded(
              flex: 2,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: AppTheme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}