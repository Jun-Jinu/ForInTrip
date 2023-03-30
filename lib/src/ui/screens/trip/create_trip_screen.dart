import 'package:flutter/material.dart';
import '../../widgets/card/trip_card.dart';
import '../../widgets/appbar/menu_appbar.dart';
import '../../theme/app_color.dart';

class CreateTripScreen extends StatelessWidget {
  const CreateTripScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(
        title: "Create Trip",
        isActionButton: true,
        onActionButtonPressed: () {}, //Done의 콜백
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // align text to the left
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.5),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "May 14th Plan",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.5),
                child: Card(
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
              ),
              TripCard(
                imageUrl: 'https://picsum.photos/200',
                title: "Trip TITLE",
                subtitle: "Lunch",
              ),
              Padding(
                padding: const EdgeInsets.all(2.5),
                child: Card(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
