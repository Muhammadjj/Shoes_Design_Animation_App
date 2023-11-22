import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text(
        "Discover",
        style: AppThemes.homeAppBar,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
            icon: const FaIcon(
              CupertinoIcons.search,
              color: AppConstantsColor.darkTextColor,
              size: 25,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 4),
          child: IconButton(
            icon: const FaIcon(
              CupertinoIcons.bell,
              color: AppConstantsColor.darkTextColor,
              size: 25,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
