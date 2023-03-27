import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/category_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_in_trip/src/bloc/home_bloc.dart';

import '../screens/trip_plan_screen.dart';
import '../screens/my_profile_screen.dart';
import '../screens/search_screen.dart';
import '../screens/create_trip_screen.dart';

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
            const CreateTripScreen(),
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
