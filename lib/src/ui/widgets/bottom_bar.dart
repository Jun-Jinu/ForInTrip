import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/pages/home_page.dart';
import 'package:for_in_trip/src/ui/pages/category_page.dart';

// 화면 전환 애니메이션을 없애기위한 커스텀 위젯
class NoAnimationPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationPageRoute({required WidgetBuilder builder})
      : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

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
                Navigator.push(
                  context,
                  NoAnimationPageRoute(builder: (context) => const HomePage()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  NoAnimationPageRoute(
                      builder: (context) => const CategoryPage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  NoAnimationPageRoute(builder: (context) => const HomePage()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  NoAnimationPageRoute(
                      builder: (context) => const CategoryPage()),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
