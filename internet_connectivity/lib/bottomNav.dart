// import 'dart:ffi';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(NavScreen());
// }

// class NavScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Custom Navigation Bar',
//       theme: ThemeData(
//           primaryColor: Colors.green), // Setting the default theme to green
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Navigation Bar'),
//       ),
//       body: Center(
//         child: Text(
//           'Selected Index: $_selectedIndex',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0), // Adjust border radius as needed
//           topRight: Radius.circular(20.0),
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.shifting,
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           selectedItemColor: Colors.green,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               backgroundColor: Colors.black,
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               label: 'Search',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: 'Favorites',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Example'),
      ),
      body: const Center(
        child: Text('Page '),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0), // Adjust border radius as needed
          topRight: Radius.circular(25.0),
        ),
        child: GNav(
          gap: 8,
          color: Colors.white,
          activeColor: Colors.white,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          duration: const Duration(milliseconds: 800),
          tabBackgroundColor: Colors.green,
          backgroundColor: Colors.black,
          tabMargin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          tabs: [
            const GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            const GButton(
              icon: Icons.format_list_bulleted,
              text: 'Search',
            ),
            const GButton(
              icon: Icons.favorite,
              text: 'Favorites',
            ),
            const GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
          selectedIndex: selectedIndex,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:internet_connectivity/Nav/cubit/tab_state_cubit.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TabStateCubit(),
//       child: MaterialApp(
//         title: 'Bottom Navigation Bar Example',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final tabBloc = BlocProvider.of<TabStateCubit>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bottom Navigation Bar Example'),
//       ),
//       body: Center(
//         child: Text('Page '),
//       ),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25.0), // Adjust border radius as needed
//           topRight: Radius.circular(25.0),
//         ),
//         child: BlocBuilder<TabStateCubit, int>(
//           builder: (context, state) {
//             return GNav(
//               gap: 8,
//               color: Colors.white,
//               activeColor: Colors.white,
//               iconSize: 24,
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               duration: Duration(milliseconds: 800),
//               tabBackgroundColor: Colors.green,
//               backgroundColor: Colors.black,
//               tabMargin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//               tabs: [
//                 GButton(
//                   icon: Icons.home,
//                   text: 'Home',
//                 ),
//                 GButton(
//                   icon: Icons.search,
//                   text: 'Search',
//                 ),
//                 GButton(
//                   icon: Icons.favorite,
//                   text: 'Favorites',
//                 ),
//                 GButton(
//                   icon: Icons.person,
//                   text: 'Profile',
//                 ),
//               ],
//               selectedIndex: state,
//               onTabChange: (index) {
//                 tabBloc.TabChange(index);
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
