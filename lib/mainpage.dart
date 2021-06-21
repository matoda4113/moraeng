import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moraeng/bottom/homescreen.dart';
import 'package:moraeng/bottom/userscreen.dart';
import 'package:moraeng/page/signinpage.dart';
import 'package:moraeng/provider/userprovider.dart';
import 'package:moraeng/testscreen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UserProvider userProvider= Get.find();
  int selectedIndex=0;
  List<Widget>bodyList=[

    HomeScreen(),
    TestScreen(),
    SignInPage(),
    UserScreen(),


  ];


  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProvider>(
        builder: (_){
          if(userProvider.userFS!=null) return Scaffold(

            bottomNavigationBar: SalomonBottomBar(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),

              currentIndex: selectedIndex,
              onTap: (i) => setState(() => selectedIndex = i),
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                  selectedColor: Colors.purple,
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.favorite_border),
                  title: Text("Likes"),
                  selectedColor: Colors.pink,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(Icons.search),
                  title: Text("Search"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: Colors.teal,
                ),
              ],
            ),
            body: bodyList[selectedIndex],
          );
          else return SignInPage();
        });
  }
}
