import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../pages/search_page.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  const DefaultAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "ForInTrip",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFA300),
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xFFFFA300),
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SearchPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: const Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                          reverseCurve: Curves.easeIn,
                        ),
                      ),
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
