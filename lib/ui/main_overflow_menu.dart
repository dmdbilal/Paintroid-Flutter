import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:paintroid/io/src/ui/about_dialog.dart';
import 'package:paintroid/ui/util.dart';

enum MainOverflowMenuOption {
  rate("Rate us!"),
  help("Help"),
  about("About"),
  feedback("Feedback");

  const MainOverflowMenuOption(this.label);

  final String label;
}

class MainOverflowMenu extends ConsumerStatefulWidget {
  const MainOverflowMenu({Key? key}) : super(key: key);

  @override
  ConsumerState<MainOverflowMenu> createState() => _MainOverFlowMenuState();
}

class _MainOverFlowMenuState extends ConsumerState<MainOverflowMenu> {
  final feedbackUrl = 'mailto:support-paintroid@catrobat.org';
  final iOSAppId = 'org.catrobat.paintroidflutter';
  final androidAppId = 'org.catrobat.paintroid';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Theme.of(context).colorScheme.background,
      icon: const Icon(Icons.more_vert),
      shape: RoundedRectangleBorder(
        side: const BorderSide(),
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: _handleSelectedOption,
      itemBuilder: (BuildContext context) => MainOverflowMenuOption.values
          .map((option) =>
              PopupMenuItem(value: option, child: Text(option.label)))
          .toList(),
    );
  }

  void _handleSelectedOption(MainOverflowMenuOption option) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    switch (option) {
      case MainOverflowMenuOption.rate:
        LaunchReview.launch(androidAppId: androidAppId, iOSAppId: iOSAppId);
        break;
      case MainOverflowMenuOption.help:
        break;
      case MainOverflowMenuOption.about:
        if (mounted) {
          showMyAboutDialog(context, version);
        }
        break;
      case MainOverflowMenuOption.feedback:
        openUrl(feedbackUrl);
        break;
    }
  }
}