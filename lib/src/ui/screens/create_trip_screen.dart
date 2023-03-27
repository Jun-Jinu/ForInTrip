import 'package:flutter/material.dart';
import '../widgets/default_appbar.dart';
import '../widgets/trip_card.dart';

import '../theme/app_color.dart';

class CreateTripScreen extends StatelessWidget {
  const CreateTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(),
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
