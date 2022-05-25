import 'dart:async';


import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:se373_project/Pages/createAccount.dart';
import 'package:se373_project/Pages/directMessage.dart';
import 'package:se373_project/Pages/createPost.dart';
import 'package:se373_project/Pages/home.dart';
import 'package:se373_project/Pages/search.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se373_project/Pages/signIn.dart';
// @dart=2.9

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
        home: MyHomePage()
    ),
  );
}



class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}




class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int _pageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {

    super.initState();
    _pageController = PageController(initialPage: _pageIndex);

  }
  @override
  void dispose() {

    _pageController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {


    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          iconSize: 24,
          selectedFontSize: 15,
          unselectedFontSize: 12,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _pageIndex,
          items: _items,
        ),
      ),
      children: <Widget>[
        homePage('0'),
        searchPage('1'),
        DMPage('2'),
        createpostPage('3'),
        createAccountPage('4'),
      ],
      /*body: PageView(
        children: screens,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),*/
      onItemTap: (index){},

    );
  }
  final _items=[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: 'Home',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message_outlined),
      label: 'DM',
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.post_add),
      label: "Create Post",
      backgroundColor: Colors.white,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Account',
      backgroundColor: Colors.white,
    ),

  ];


  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }
  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(microseconds: 1),curve: Curves.bounceIn);
  }



}
