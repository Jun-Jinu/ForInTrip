import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        height: 60,
        child: TabBar(
          controller: _tabController, // TabController 연결
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 18,
              ),
              child: Text(
                '홈',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size: 18,
              ),
              child: Text(
                '검색',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.save_alt,
                size: 18,
              ),
              child: Text(
                '저장 목록',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.list,
                size: 18,
              ),
              child: Text(
                '더 보기',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
            ),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed('/home'); // '/' 경로로 이동
                break;
              case 1:
                Navigator.of(context).pushNamed('/search'); // '/search' 경로로 이동
                break;
              case 2:
                Navigator.of(context).pushNamed('/saved'); // '/saved' 경로로 이동
                break;
              case 3:
                Navigator.of(context).pushNamed('/more'); // '/more' 경로로 이동
                break;
            }
          },
        ),
      ),
    );
  }
}
