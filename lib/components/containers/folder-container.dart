import 'package:dashboard_ui/components/containers/rounded-container.dart';
import 'package:dashboard_ui/theme.dart';
import 'package:flutter/material.dart';

class FolderContainer extends StatelessWidget {
  final _maxFiles = 2000;

  final IconData icon;
  final Color color;
  final String title;
  final int totalFiles;
  final double totalSpace;
  final double size;

  const FolderContainer({
    required this.size,
    required this.icon,
    required this.color,
    required this.title,
    required this.totalFiles,
    required this.totalSpace,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: size, height: size,
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedContainer(
                color: color.withOpacity(.25),
                child: Icon(icon, color: color),
              ),

              PopupMenuButton(
                tooltip: '',
                color: AppTheme.colorScheme.background,
                icon: Icon(Icons.more_vert_rounded, color: AppTheme.colorScheme.onSecondary),
                itemBuilder: (_) {
                  const textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
                  return [
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.open_in_new_rounded, size: 18),
                        title: Text('Abrir', style: textStyle),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.sync_rounded, size: 18),
                        title: Text('Sincronizar', style: textStyle),
                      ),
                    ),
                  ];
                },
              ),
            ],
          ),

          Text(title),

          Stack(
            children: [
              Container(
                height: 5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: color.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              LayoutBuilder(
                builder: (_, constraints) {
                  return Container(
                    height: 5,
                    width: constraints.maxWidth*(totalFiles*100/_maxFiles)/100,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$totalFiles files', style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text('${totalSpace}GB', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
