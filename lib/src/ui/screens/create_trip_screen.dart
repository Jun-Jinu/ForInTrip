import 'package:flutter/material.dart';
import '../widgets/trip_card.dart';
import '../theme/app_color.dart';

class CreateTripScreen extends StatelessWidget {
  const CreateTripScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Colors.transparent, // set background color to transparent
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: gray1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create Trip',
          style: TextStyle(
            color: gray1,
            fontSize: 20.0,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: TextStyle(
                color: gray1,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 5.0),
                TripCard(
                  imageUrl: "",
                  title: "123",
                  subtitle: "sub",
                ),
                const SizedBox(height: 5.0),
                Card(
                  color: gray6,
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.add,
                        size: 36.0,
                        color: gray3,
                      ),
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
