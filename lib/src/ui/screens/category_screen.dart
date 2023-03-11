// import 'package:flutter/material.dart';
// import '../theme/app_color.dart';
// import '../widgets/bottom_bar.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:for_in_trip/src/bloc/home_bloc.dart';

// class CategoryScreen extends StatelessWidget {
//   const CategoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(100.0),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: AppBar(
//             title: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "ForInTrip",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 30.0,
//                   fontWeight: FontWeight.w700,
//                   color: grey,
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               IconButton(icon: Icon(Icons.notifications), onPressed: null),
//             ],
//             centerTitle: false,
//             backgroundColor: transparent,
//             elevation: 0,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Center(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   child: Column(
//                     children: [
//                       Text("data"),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: const BottomBar(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:for_in_trip/src/ui/widgets/sliding_segmented_control.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<CategoryScreen> {
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliding Segmented Control'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SlidingSegmentedControl(
            children: {
              0: const Text('Category 1'),
              1: const Text('Category 2'),
              2: const Text('Category 3'),
            },
            onValueChanged: (value) {
              setState(() {
                _selectedSegment = value;
              });
            },
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedSegment,
              children: [
                // Widget for category 1
                const Center(child: Text('Category 1')),

                // Widget for category 2
                const Center(child: Text('Category 2')),

                // Widget for category 3
                const Center(child: Text('Category 3')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
