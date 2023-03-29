import 'package:flutter/material.dart';
import '../widgets/appbar/menu_appbar.dart';
import '../screens/login_screen.dart';
import '../theme/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: lightPrimaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30.0,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: 400.0,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                color: lightPrimaryColor,
              ),
              Positioned(
                top: 130,
                left: 0,
                right: 0,
                child: Center(
                  child: Card(
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://example.com/image.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 280,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 140,
                    child: Stack(
                      children: [
                        TextFormField(
                          initialValue: "test",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          cursorColor: gray1,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              // Handle photo attachment functionality
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.photo_camera,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
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
    );
  }
}
