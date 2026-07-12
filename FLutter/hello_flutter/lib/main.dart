import 'package:flutter/material.dart';

void main() {
  runApp(const OstadApp());
}

class OstadApp extends StatelessWidget {
  const OstadApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ostad App'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        body: const Center(child: Text('Welcome to ostad App!')),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'Ostad App Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(leading: Icon(Icons.search), title: Text('Search')),
              ListTile(leading: Icon(Icons.person), title: Text('Profile')),
            ],
          ),
        ),
      ),
    );
  }
}
