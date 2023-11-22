import 'package:flutter/material.dart';

import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';

PreferredSize? customAppBarProfile() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Padding(
        padding: EdgeInsets.only(
          top: 8.0,
        ),
        child: Text(
          "My Profile",
          style: AppThemes.profileAppBarTitle,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 8.0, right: 5),
          child: Icon(
            Icons.more_vert,
            color: AppConstantsColor.darkTextColor,
          ),
        )
      ],
    ),
  );
}