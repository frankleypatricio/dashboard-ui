import 'package:dashboard_ui/components/containers/file-container.dart';
import 'package:dashboard_ui/components/containers/folder-container.dart';
import 'package:dashboard_ui/components/containers/rounded-container.dart';
import 'package:dashboard_ui/config.dart';
import 'package:dashboard_ui/enums/filetype.dart';
import 'package:dashboard_ui/models/datafile.dart';
import 'package:dashboard_ui/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<DataFile> _recentFiles = [
    DataFile('Image File', '01/10/2023', 0.6, FileType.image),
    DataFile('Video File', '02/10/2023', 50.6, FileType.video),
    DataFile('Audio File', '02/10/2023', 3.2, FileType.audio),
    DataFile('Word File', '05/10/2023', 2.3, FileType.word),
    DataFile('Excel File', '06/10/2023', 5.0, FileType.excel),
    DataFile('Code File', '07/10/2023', 0.3, FileType.code),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -----------------------
        // APPBAR
        // -----------------------
        if(!AppConfig.isMobile) LayoutBuilder(
            builder: (_, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dashboard', style: AppTheme.themeData.textTheme.titleLarge),
                    Row(
                      children: [
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

                        RoundedContainer(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppTheme.colorScheme.background,
                                child: Icon(FontAwesomeIcons.user, color: AppTheme.colorScheme.onBackground),
                              ),
                              const Text('   Username'),
                              InkWell(
                                onTap: (){},
                                child: const Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
        ),

        LimitedBox(
          maxHeight: AppConfig.screenHeight-80,
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -----------------------
                // BODY
                // -----------------------
                Expanded(                             // else == isTablet
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      children: [
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
                              final size = AppConfig.isMobile ? 120.0 : 150.0;
                              final scrollController = ScrollController();
                              return Scrollbar(
                                controller: scrollController,
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
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
                                        totalSpace: 25.1,
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
                                        color: const Color(0xFF45ADE8),
                                        title: 'Steam',
                                        totalFiles: 850,
                                        totalSpace: 30.5,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                        const SizedBox(height: 12),

                        Builder(
                            builder: (context) {
                              final scrollController = ScrollController();
                              return RoundedContainer(
                                width: double.maxFinite,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Arquivos recentes', style: AppTheme.themeData.textTheme.titleMedium),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      height: AppConfig.getHeight(47),
                                      width: double.maxFinite,
                                      child: Scrollbar(
                                        thumbVisibility: true,
                                        controller: scrollController,
                                        child: SingleChildScrollView(
                                          controller: scrollController,
                                          child: DataTable(
                                            columns: const [
                                              DataColumn(label: Text('Nome')),
                                              DataColumn(label: Text('Data')),
                                              DataColumn(label: Text('Tamanho')),
                                            ],
                                            rows: _buildRow(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                        ),

                        if(AppConfig.isMobile) Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: _buildAside(200),
                        ),
                      ],
                    ),
                  ),
                ),

                // -----------------------
                // ASIDE
                // -----------------------
                if(!AppConfig.isMobile) Expanded(
                  child: _buildAside(double.maxFinite),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  List<DataRow> _buildRow() {
    List<DataRow> listRow = [];

    for (var f in _recentFiles) {
      listRow.add(DataRow(
        cells: [
          DataCell(Row(
            children: [
              RoundedContainer(
                margin: const EdgeInsets.only(right: 12),
                color: f.tipo.color,
                child: Icon(f.tipo.icon, size: 16),
              ),
              Text(f.nome, overflow: TextOverflow.ellipsis,),
            ],
          )),
          DataCell(Text(f.data)),
          DataCell(Text('${f.tamanho}mb')),
        ],
      ));
    }

    return listRow;
  }

  Widget _buildAside([double? height]) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          // height: height,
          color: AppTheme.colorScheme.secondary,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Detalhes de Armazenamento', style: AppTheme.themeData.textTheme.titleMedium),

              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 70,
                        startDegreeOffset: -90,
                        sections: [
                          PieChartSectionData(
                            value: 25,
                            radius: 25,
                            showTitle: false,
                            color: Colors.blue,
                          ),
                          PieChartSectionData(
                            value: 20,
                            radius: 22,
                            showTitle: false,
                            color: Colors.cyanAccent,
                          ),
                          PieChartSectionData(
                            value: 10,
                            radius: 19,
                            showTitle: false,
                            color: Colors.yellow,
                          ),
                          PieChartSectionData(
                            value: 15,
                            radius: 16,
                            showTitle: false,
                            color: Colors.red,
                          ),
                          PieChartSectionData(
                            value: 25,
                            radius: 13,
                            showTitle: false,
                            color: AppTheme.colorScheme.background,
                          ),
                        ],
                      ),
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
                ),
              ),

              FileContainer(
                icon: const Icon(Icons.description_rounded, color: Colors.blue),
                title: 'Documentos',
                totalFiles: 1632,
                totalSize: 1.3,
              ),
              FileContainer(
                icon: const Icon(Icons.perm_media_rounded, color: Colors.cyanAccent),
                title: 'Media',
                totalFiles: 1500,
                totalSize: 1.3,
              ),
              FileContainer(
                icon: const Icon(Icons.folder_rounded, color: Colors.yellow),
                title: 'Pastas',
                totalFiles: 230,
                totalSize: 1.3,
              ),
              FileContainer(
                icon: const Icon(Icons.insert_drive_file_rounded, color: Colors.red),
                title: 'Outros',
                totalFiles: 1328,
                totalSize: 1.3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}