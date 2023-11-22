import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:shoes_app_firebase/utils/constants.dart';
import 'package:shoes_app_firebase/view/Bag/Components/bag_view.dart';
import 'package:shoes_app_firebase/view/User_Profile/user_profile_view.dart';
import 'package:shoes_app_firebase/view/view.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  // * PageView Controller .
  final PageController _controller = PageController();
  // * Bottom Navigation Bar selected index store this variable .
  int _selectedIndex = 0;
  // * Bottom Navigation Bar manage the indexes
  void onTapNavigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
    //  change the page smooth animation .
    _controller.animateToPage(_selectedIndex,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
  }

  // * PageController View Screens .
  final List<Widget> _screens = [
    // 1st Screen
    const HomeView(),
    const BagView(),
    const Profile(),
  ];

  @override
  void dispose() {
    // Todo: implement dispose.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: CustomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: onTapNavigator,
          bubbleCurve: Curves.bounceInOut,
          iconSize: 27.0,
          elevation: 8,
          scaleFactor: 0.1,
          selectedColor: AppConstantsColor.materialButtonColor,
          strokeColor: AppConstantsColor.materialButtonColor,
          unSelectedColor: Colors.grey,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.home,
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.shopping_cart,
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(
                CupertinoIcons.person,
              ),
            ),
          ]),
    );
  }
}
