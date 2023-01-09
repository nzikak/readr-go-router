import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readr/book/home/bookmarks_tab.dart';
import 'package:readr/book/home/explore_tab.dart';
import 'package:readr/book/home/profile_tab.dart';
import 'package:readr/providers/tab_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final _homeTabs = const [
    ExploreTab(),
    BookmarksTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, tabProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(tabProvider.currentTab.name),
            centerTitle: true,
          ),
          body: _homeTabs[tabProvider.currentTab.index],
          bottomNavigationBar: BottomNavigationBar(
            items: _bottomNavBarItems(),
            currentIndex: tabProvider.currentTab.index,
            onTap: (index) {
              tabProvider.setCurrentTab(index);
            },
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _bottomNavBarItems() => const [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Bookmarks"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ];
}
