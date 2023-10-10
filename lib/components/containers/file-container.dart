import 'package:dashboard_ui/components/containers/rounded-container.dart';
import 'package:dashboard_ui/theme.dart';
import 'package:flutter/material.dart';

class FileContainer extends StatelessWidget {
  final Icon icon;
  final String title;
  final int totalFiles;
  final double totalSize;

  FileContainer({
    required this.icon,
    required this.title,
    required this.totalFiles,
    required this.totalSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      border: Border.all(color: AppTheme.colorScheme.onSecondary.withOpacity(.1), width: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    '$totalFiles arquivos',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text('${totalSize}GB'),
        ],
      ),
    );
  }
}
