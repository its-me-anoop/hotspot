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
        return BottomNavigationBar(
            currentIndex: currentPage.currentPage,
            onTap: (index) {
              context.read<PageSelection>().changePage(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_people_outlined),
                  label: "Prayer requests"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_events_outlined),
                  label: "Saint of the day"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: "Thanks giving")
            ]);
      },
    );
  }
}
