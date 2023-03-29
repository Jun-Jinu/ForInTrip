import 'package:flutter/material.dart';

class MenuDetailScreen extends StatelessWidget {
  const MenuDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
            title: Text('List Tile ${index + 1}'),
            subtitle: Text('This is a subtitle for List Tile ${index + 1}'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // do something when the tile is tapped
            },
          );
        },
      ),
    );
  }
}
