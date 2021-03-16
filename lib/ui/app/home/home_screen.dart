import 'package:flutter/material.dart';
import 'package:marvin_app/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: navigationProvider.index,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.movie),
      //       label: 'Comics',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.more_horiz),
      //       label: 'Others',
      //     )
      //   ],
      //   onTap: (value) {
      //     navigationProvider.setCurrentIndex(value);
      //   },
      // ),
      appBar: AppBar(
        title: Text('Marvel'),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
        ],
      ),

      drawer: Drawer(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  navigationProvider.setCurrentIndex(0);
                },
                child: Row(
                  children: [
                    Text('Home'),
                    Spacer(),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  navigationProvider.setCurrentIndex(1);
                },
                child: Row(
                  children: [
                    Text('Comics'),
                    Spacer(),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text('Others'),
                    Spacer(),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: navigationProvider.currentPage,
    );
  }
}
