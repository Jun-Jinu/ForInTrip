import 'package:flutter/material.dart';
import '../../widgets/appbar/menu_appbar.dart';
import '../../theme/app_color.dart';

import '../../widgets/place_carousel.dart';

import '../../widgets/place_list_tile.dart';
import '../../widgets/place_menu_container.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(
        title: "Place Details",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceCarousel(
              images: [
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200'
              ],
            ),
            SizedBox(height: 10.0),
            // InkWell(
            //   onTap: () {},
            //   child: ListTile(
            //     contentPadding:
            //         EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            //     title: Text("Title"),
            //     subtitle: Text("Subtitle"),
            //     trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            //     tileColor: Colors.white,
            //   ),
            // ),

            PlaceListTile(
              title: "Place Name",
              subtitle: "Place category",
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // Handle heart icon tap
                },
              ),
            ),

            const SizedBox(height: 5.0),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                border: Border(
                  top: BorderSide(width: 1.0, color: gray6),
                  bottom: BorderSide(width: 1.5, color: gray6),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Place Name",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Place category",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: gray3,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.0),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text("Check-in"),
                subtitle: Text("Wed, 01 Sep 2021"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text("Check-out"),
                subtitle: Text("Sat, 04 Sep 2021"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.hotel),
                  SizedBox(width: 8.0),
                  Text("2 Rooms, 4 Guests"),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$500",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            //리뷰 메뉴
            InkWell(
              onTap: () {},
              child: PlaceListTile(
                leading: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Text(
                      "9.9",
                      style: TextStyle(
                        color: white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                title: "Good",
                subtitle: "N개의 상세 리뷰 보기",
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            PlaceMenuContainer(
              title: "다녀간 사람들의 리뷰",
              children: [
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text("Nickname"),
                  subtitle: Text("Korea"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("직원분들이 친절했고 깨끗해서 좋았습니다."),
                ),
                SizedBox(height: 20.0),
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text("Nickname"),
                  subtitle: Text("Korea"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("직원분들이 친절했고 깨끗해서 좋았습니다."),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListTile(
            title: Text(
              "장소이름",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("장소 부제 - 뭐 넣을지 아직 모르겠음"),
            trailing: ElevatedButton(
              child: Text("여행지 선택하기"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              onPressed: () {
                // Handle reserve button tap
              },
            ),
          ),
        ),
      ),
    );
  }
}
