import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/theme/app_color.dart';

class PlaceCarousel extends StatefulWidget {
  final List<String> images;

  const PlaceCarousel({Key? key, required this.images}) : super(key: key);

  @override
  _PlaceCarouselState createState() => _PlaceCarouselState();
}

class _PlaceCarouselState extends State<PlaceCarousel> {
  final CarouselController _controller = CarouselController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.linear,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 3000),
            viewportFraction: 1.0,
            onPageChanged: (index, _) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          items: widget.images
              .map((item) =>
                  Image.network(item, fit: BoxFit.cover, width: 1000.0))
              .toList(),
        ),
        Positioned(
          left: 10,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: white),
            onPressed: () => _controller.previousPage(),
          ),
        ),
        Positioned(
          right: 10,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: white),
            onPressed: () => _controller.nextPage(),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15.0)),
            child: Text(
              '${_currentPage + 1} / ${widget.images.length}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
