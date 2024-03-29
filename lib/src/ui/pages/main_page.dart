import 'package:flutter/material.dart';
import '../screens/main/home_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_in_trip/src/bloc/home_bloc.dart';

import '../screens/trip/trip_plan_screen.dart';
import '../screens/main/my_profile_screen.dart';
import '../screens/common_menu/search_screen.dart';
import '../screens/trip/create_trip_screen.dart';
import '../screens/trip/create_trip_intro_screen.dart';

//test pages
import '../screens/member_management/sign_up_screen.dart';
import '../screens/member_management/login_screen.dart';

import '../screens/my_page_menu/profile.dart';
import '../screens/my_page_menu/menu_detail_screen.dart';
import '../screens/trip/trip_detail_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

// return BlocProvider<CounterBloc>(
//       create: (BuildContext context) => CounterBloc(),
//       child: const HomeScreen(),
//     );
class _MainPageState extends State<MainPage>
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

    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            const HomeScreen(),
            // MenuDetailScreen(),
            // const CreateTripScreen(),
            CreateTripIntroScreen(),
            TripPlanScreen(),
            MyProfileScreen(),
          ],
        ),
        bottomNavigationBar: Container(
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
                    'Home',
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
                    Icons.add_circle_outline,
                    size: iconSize,
                  ),
                  child: Text(
                    'Create Trip',
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
                    Icons.list_alt,
                    size: iconSize,
                  ),
                  child: Text(
                    'Trip Manage',
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
                    Icons.person,
                    size: iconSize,
                  ),
                  child: Text(
                    'My Page',
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
        ),
      ),
    );
  }
}
