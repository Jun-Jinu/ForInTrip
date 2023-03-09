import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_in_trip/src/bloc/home_bloc.dart';

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
  Category(name: 'Category 1', image: 'images/bd.jpg'),
  Category(name: 'Category 2', image: 'images/bz.jpg'),
  Category(name: 'Category 3', image: 'images/bz.jpg'),
  Category(name: 'Category 4', image: 'images/ep.jpg'),
  Category(name: 'Category 5', image: 'images/ep.jpg'),
  Category(name: 'Category 6', image: 'images/bd.jpg'),
  Category(name: 'Category 7', image: 'images/gw.jpg'),
  Category(name: 'Category 8', image: 'images/gw.jpg'),
  Category(name: 'Category 1', image: 'images/bd.jpg'),
  Category(name: 'Category 2', image: 'images/bz.jpg'),
  Category(name: 'Category 3', image: 'images/bz.jpg'),
  Category(name: 'Category 4', image: 'images/ep.jpg'),
  Category(name: 'Category 5', image: 'images/ep.jpg'),
  Category(name: 'Category 6', image: 'images/bd.jpg'),
  Category(name: 'Category 7', image: 'images/gw.jpg'),
  Category(name: 'Category 8', image: 'images/gw.jpg'),
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
    const categoryRowItemCount = 6;
    const categoryItemSpacing = 10.0;
    final mediaSize = MediaQuery.of(context).size;
    final double itemSize = ((mediaSize.width -
                30.0 -
                (categoryItemSpacing * (categoryRowItemCount - 1))) /
            categoryRowItemCount) -
        20.0;

    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
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
            // Icon(
            //   Icons.arrow_back_ios,
            //   color: Colors.black,
            // ),
            // title: Text(
            //   '청원게시판',
            //   style: TextStyle(
            //     fontSize: 18.0,
            //     color: Colors.black,
            //   ),
            // ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.notifications), onPressed: null),
            ],
            centerTitle: true,
            backgroundColor: transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                  crossAxisCount: 6,
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
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
