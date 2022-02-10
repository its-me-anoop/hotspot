import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotspot/logic/page_selection_logic.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageSelection>(
      builder: (context, PageSelection currentPage, child) {
        return Stack(
          children: [
            Positioned(
              bottom: 0,
              height: 200,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 58,
                  decoration: const BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
            ),
            BottomNavigationBar(
                backgroundColor: Theme.of(context).cardColor.withOpacity(0.3),
                elevation: 0,
                currentIndex: currentPage.currentPage,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                  context.read<PageSelection>().changePage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.emoji_people_outlined,
                        size: 40,
                      ),
                      label: "Prayer requests"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite_outline,
                        size: 30,
                      ),
                      label: "Thanks giving"),
                  // BottomNavigationBarItem(
                  //     icon: Icon(
                  //       Icons.person_outlined,
                  //       size: 30,
                  //     ),
                  //     label: "Profile"),
                  // BottomNavigationBarItem(
                  //     icon: Icon(
                  //       Icons.settings,
                  //       size: 30,
                  //     ),
                  //     label: "Settings"),
                  // BottomNavigationBarItem(
                  //     icon: Icon(
                  //       Icons.settings,
                  //       size: 30,
                  //     ),
                  //     label: "Settings"),
                ])
          ],
        );
      },
    );
  }
}
