import 'package:flutter/material.dart';
import '../widgets/appbar/menu_appbar.dart';
import '../theme/app_color.dart';

class MenuDetailScreen extends StatelessWidget {
  const MenuDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(
        title: "메뉴이름",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 24.0),
              child: Text(
                '카테고리1',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      'List Tile ${index + 1}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    contentPadding: EdgeInsets.all(10),
                    shape: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    ),
                    onTap: () {
                      // do something when the tile is tapped
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 24.0),
              child: Text(
                '카테고리2',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      'List Tile ${index + 1}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    contentPadding: EdgeInsets.all(10),
                    shape: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1),
                    ),
                    onTap: () {
                      // do something when the tile is tapped
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 60.0,
            )
          ],
        ),
      ),
    );
  }
}
