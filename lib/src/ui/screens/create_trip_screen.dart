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
              TripCard(
                imageUrl: "",
                title: "123",
                subtitle: "sub",
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
