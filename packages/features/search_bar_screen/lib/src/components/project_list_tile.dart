import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:io_library/io_library.dart';
import 'package:search_bar_screen/src/components/image_preview.dart';
import 'package:search_bar_screen/src/components/project_overflow_menu.dart';

class ProjectListTile extends StatelessWidget {
  final Project project;
  final IImageService imageService;
  final int index;
  final VoidCallback onTap;

  const ProjectListTile({
    super.key,
    required this.project,
    required this.imageService,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy');

    return Card(
      child: ListTile(
        leading: ImagePreview(
          project: project,
          imageService: imageService,
          width: 80,
          color: Colors.white,
        ),
        dense: false,
        title: Text(
          project.name,
          style: const TextStyle(color: Color(0xFFFFFFFF)),
        ),
        subtitle: Text(
          'last modified: ${dateFormat.format(project.lastModified)}',
          style: const TextStyle(color: Color(0xFFFFFFFF)),
        ),
        trailing: ProjectOverflowMenu(
          key: Key('ProjectOverflowMenu Key$index'),
          project: project,
        ),
        enabled: true,
        onTap: onTap,
      ),
    );
  }
}
