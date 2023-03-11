import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../widgets/bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_in_trip/src/bloc/home_bloc.dart';
// import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:for_in_trip/src/ui/pages/category_page.dart';
import 'dart:async';

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

List<Category> categories = [
  Category(name: 'Category 1', image: 'images/bd.jpg'),
  Category(name: 'Category 2', image: 'images/bz.jpg'),
  Category(name: 'Category 3', image: 'images/bz.jpg'),
  Category(name: 'Category 4', image: 'images/ep.jpg'),
  Category(name: 'Category 5', image: 'images/ep.jpg'),
  Category(name: 'Category 6', image: 'images/bd.jpg'),
  Category(name: 'Category 7', image: 'images/gw.jpg'),
  Category(name: 'Category 8', image: 'images/gw.jpg'),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const categoryRowItemCount = 5;
    const categoryItemSpacing = 10.0;
    final mediaSize = MediaQuery.of(context).size;
    final double itemSize = ((mediaSize.width -
                30.0 -
                (categoryItemSpacing * (categoryRowItemCount - 1))) /
            categoryRowItemCount) -
        20.0;

    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    // Completer<NaverMapController> _controller = Completer();
    // MapType _mapType = MapType.Basic;
    //
    // void onMapCreated(NaverMapController controller) {
    //   if (_controller.isCompleted) _controller = Completer();
    //   _controller.complete(controller);
    // }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppBar(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ForInTrip",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: grey,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.notifications), onPressed: null),
            ],
            backgroundColor: transparent,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   child: NaverMap(
                //     onMapCreated: onMapCreated,
                //     mapType: _mapType,
                //   ),
                // ),
                // BlocBuilder<CounterBloc, int>(
                //   builder: (context, count) {
                //     return Text(
                //       '$count',
                //       style: TextStyle(fontSize: 48.0),
                //     );
                //   },
                // ),
                // SizedBox(height: 24.0),
                GridView.builder(
                  itemCount: (categories.length <= 24 ? categories.length : 24),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: categoryRowItemCount,
                    crossAxisSpacing: categoryItemSpacing,
                    mainAxisSpacing: categoryItemSpacing,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: itemSize,
                          width: itemSize,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(categories[index].image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          categories[index].name,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryPage()),
                      ),
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: Column(
                        children: [
                          // 카드 이미지
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://picsum.photos/200',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // ListTile
                          ListTile(
                            title: Text('Do you know BTS?'),
                            subtitle: Text('Find out where k-pop is related!'),
                            trailing: Icon(Icons.arrow_forward),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
