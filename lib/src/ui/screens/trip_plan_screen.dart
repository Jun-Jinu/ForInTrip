import 'package:flutter/material.dart';
import '../widgets/trip_card.dart';

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
      appBar: AppBar(
        title: Text('Trip Plan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
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
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              )
                            : null,
                      ),
                      child: Text(
                        'Coming Trip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
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
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              )
                            : null,
                      ),
                      child: Text(
                        'All Trip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
