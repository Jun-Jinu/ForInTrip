import 'dart:math';

import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/screens/trip/create_trip_screen.dart';
import '../../widgets/card/trip_card.dart';
import '../../widgets/appbar/menu_appbar.dart';
import '../../theme/app_color.dart';
import '../trip/create_trip_intro_screen.dart';

class TripPlanScreen extends StatefulWidget {
  const TripPlanScreen({Key? key}) : super(key: key);

  @override
  _TripPlanScreenState createState() => _TripPlanScreenState();
}

class _TripPlanScreenState extends State<TripPlanScreen> {
  bool _isComingTripSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(
        title: "Trip Plan",
        isActionButton: true,
        onActionButtonPressed: () {}, //Done의 콜백
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isComingTripSelected = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _isComingTripSelected
                                ? Border(
                                    bottom: BorderSide(
                                      color: primaryColor,
                                      width: 2.0,
                                    ),
                                  )
                                : Border(
                                    bottom: BorderSide(
                                      color: gray5,
                                      width: 2.0,
                                    ),
                                  ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Text(
                              'Coming Trip',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: _isComingTripSelected
                                    ? primaryColor
                                    : gray5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isComingTripSelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: !_isComingTripSelected
                                ? Border(
                                    bottom: BorderSide(
                                      color: primaryColor,
                                      width: 2.0,
                                    ),
                                  )
                                : Border(
                                    bottom: BorderSide(
                                      color: gray5,
                                      width: 2.0,
                                    ),
                                  ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Text(
                              'All Trip',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: !_isComingTripSelected
                                    ? primaryColor
                                    : gray5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // replace with your actual data size
                  itemBuilder: (BuildContext context, int index) {
                    final bool isComingTrip =
                        _isComingTripSelected; // replace with your actual filter logic
                    if ((isComingTrip && index % 2 == 0) ||
                        (!isComingTrip && index % 2 == 1)) {
                      return TripCard(
                        imageUrl: "",
                        title: "123",
                        subtitle: "sub",
                      ); // replace with your actual card component
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 32.0,
            child: FloatingActionButton(
              foregroundColor: white,
              backgroundColor: primaryColor,
              focusColor: lightPrimaryColor,
              splashColor: lightPrimaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateTripIntroScreen()),
                );
              },
              heroTag: null,
              child: Icon(
                Icons.add,
                size: 36.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
