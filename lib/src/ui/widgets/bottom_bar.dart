import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/pages/home_page.dart';
import 'package:for_in_trip/src/ui/pages/category_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const iconSize = 30.0;
    const textSize = 12.0;

    return Container(
      color: Colors.white,
      child: SizedBox(
        height: 70,
        child: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFFFFA500),
          unselectedLabelColor: const Color(0xFF949597),
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: const Icon(
                Icons.home,
                size: iconSize,
              ),
              child: Text(
                '홈',
                style: TextStyle(
                  fontSize: textSize,
                  color: _selectedIndex == 0
                      ? const Color(0xFFFFA500)
                      : const Color(0xFF949597),
                ),
              ),
            ),
            Tab(
              icon: const Icon(
                Icons.search,
                size: iconSize,
              ),
              child: Text(
                '검색',
                style: TextStyle(
                  fontSize: textSize,
                  color: _selectedIndex == 1
                      ? const Color(0xFFFFA500)
                      : const Color(0xFF949597),
                ),
              ),
            ),
            Tab(
              icon: const Icon(
                Icons.save_alt,
                size: iconSize,
              ),
              child: Text(
                '저장 목록',
                style: TextStyle(
                  fontSize: textSize,
                  color: _selectedIndex == 2
                      ? const Color(0xFFFFA500)
                      : const Color(0xFF949597),
                ),
              ),
            ),
            Tab(
              icon: const Icon(
                Icons.list,
                size: iconSize,
              ),
              child: Text(
                '더 보기',
                style: TextStyle(
                  fontSize: textSize,
                  color: _selectedIndex == 3
                      ? const Color(0xFFFFA500)
                      : const Color(0xFF949597),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
