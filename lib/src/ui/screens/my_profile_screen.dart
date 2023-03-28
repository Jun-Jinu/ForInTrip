import 'package:flutter/material.dart';
import '../widgets/appbar/menu_appbar.dart';
import '../theme/app_color.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    const cardWidth = 100.0;
    const cardHeight = 80.0;
    List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.notifications, 'title': 'Notice'},
      {'icon': Icons.settings, 'title': 'Notification Settings'},
      {'icon': Icons.language, 'title': 'Language'},
      {'icon': Icons.logout, 'title': 'Logout'},
      {'icon': Icons.headset_mic, 'title': 'Customer Center'},
    ];

    return Scaffold(
      appBar: MenuAppBar(
        title: "My Profile",
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
                title: const Text('Jinu Jun'),
                subtitle: const Text('jinujun@example.com'),
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
            Divider(
              color: gray6,
              thickness: 1.5,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: gray6,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(menuItems[index]['icon']),
                    title: Text(menuItems[index]['title']),
                    onTap: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
