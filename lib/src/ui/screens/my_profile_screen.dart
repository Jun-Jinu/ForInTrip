import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    const cardWidth = 100.0;
    const cardHeight = 80.0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: gray1),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'MyProfile',
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: gray6,
                    width: 1.5,
                  ),
                ),
              ),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: CircleAvatar(
                    foregroundColor: gray4,
                    child: Icon(
                      Icons.person,
                      color: gray5,
                    ),
                  ),
                ),
                title: const Text('John Doe'),
                subtitle: const Text('johndoe@example.com'),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                final List<String> titles = [
                  'Coupon',
                  'Orders',
                  'Favorites',
                  'Rewards'
                ];
                final List<int> counts = [0, 10, 5, 100];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: cardWidth,
                        height: cardHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                counts[index].toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                titles[index],
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 4,
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notice'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Notification Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.headset_mic),
              title: Text('Customer Center'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
