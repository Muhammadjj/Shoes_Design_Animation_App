import 'package:flutter/material.dart';
import 'package:shoes_app_firebase/view/User_Profile/Components/body.dart';
import 'package:shoes_app_firebase/view/User_Profile/Components/profile_app_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBarProfile(), body: const BodyProfile());
  }
}
