import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_flutter/config/app_icons.dart';
import 'package:study_flutter/page/home_page.dart';
import 'package:study_flutter/page/profile_page.dart';
import 'package:study_flutter/styles/app_colors.dart';

import '../components/bottom_navigation_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex.index],
      bottomNavigationBar: MyBottomNavigation(
        currentIndex: currentIndex,
        OnTap: (value) {
          if (value == Menus.add) {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container();
                });
            return;
          }
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }

  final pages = [
    HomePage(),
    const Center(
      child: Text('Favorite'),
    ),
    const Center(
      child: Text('add'),
    ),
    const Center(
      child: Text('message'),
    ),
    const ProfilePage(),
  ];
}

enum Menus {
  home,
  favorite,
  add,
  message,
  user,
}

class MyBottomNavigation extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<Menus> OnTap;
  const MyBottomNavigation(
      {super.key, required this.currentIndex, required this.OnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 17,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => OnTap(Menus.home),
                        icon: AppIcons.icHome,
                        current: currentIndex,
                        name: Menus.home),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => OnTap(Menus.favorite),
                        icon: AppIcons.icFavorite,
                        current: currentIndex,
                        name: Menus.favorite),
                  ),
                  const Spacer(),
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => OnTap(Menus.message),
                        icon: AppIcons.icMessage,
                        current: currentIndex,
                        name: Menus.message),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => OnTap(Menus.user),
                        icon: AppIcons.icUser,
                        current: currentIndex,
                        name: Menus.user),
                  ),
                ],
              ),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () => OnTap(Menus.add),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: SvgPicture.asset(AppIcons.icAdd),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                ),
              )),
        ],
      ),
    );
  }
}
