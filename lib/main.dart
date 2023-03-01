import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:test_flutter/favouriteScreen.dart';
import 'package:test_flutter/homeScreen.dart';
import 'package:test_flutter/profileScreen.dart';
import 'package:test_flutter/searchScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.blue, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavouriteScreen(),
    SearchScreen(),
    ProfileScreen(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Bottom Nav",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 0,
      ),
      body: Stack(

        children: [
          _widgetOptions.elementAt(_selectedIndex),
          // Your app content goes here
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: Container(
              // margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(60)),
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.blue[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    duration: Duration(milliseconds: 100),
                    tabBackgroundColor: Colors.blue,
                    color: Colors.black,
                    tabs: [
                      GButton(
                        icon: LineIcons.home,
                      ),
                      GButton(
                        icon: LineIcons.heart,
                      ),
                      GButton(
                        icon: LineIcons.search,
                      ),
                      GButton(
                        icon: LineIcons.user,
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                        print(index);
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// bottomNavigationBar: Container(
// margin: const EdgeInsets.all(24),
// decoration: BoxDecoration(
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// blurRadius: 20,
// color: Colors.black.withOpacity(.1),
// )
// ],
// borderRadius: BorderRadius.all(Radius.circular(60)),
// ),
// child: SafeArea(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
// child: GNav(
// rippleColor: Colors.blue[300]!,
// hoverColor: Colors.grey[100]!,
// gap: 8,
// activeColor: Colors.white,
// iconSize: 24,
// padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// duration: Duration(milliseconds: 100),
// tabBackgroundColor: Colors.blue,
// color: Colors.black,
// tabs: [
// GButton(
// icon: LineIcons.home,
// ),
// GButton(
// icon: LineIcons.heart,
// ),
// GButton(
// icon: LineIcons.search,
// ),
// GButton(
// icon: LineIcons.user,
// ),
// ],
// selectedIndex: _selectedIndex,
// onTabChange: (index) {
// setState(() {
// _selectedIndex = index;
// print(index);
// });
// },
// ),
// ),
// ),
// ),
