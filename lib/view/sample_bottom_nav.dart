import 'package:flutter/material.dart';
class Sample_Bottom_Nav extends StatefulWidget {
  const Sample_Bottom_Nav({Key? key}) : super(key: key);

  @override
  _Sample_Bottom_NavState createState() => _Sample_Bottom_NavState();
}

class _Sample_Bottom_NavState extends State<Sample_Bottom_Nav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Navigation Example")),
      body: Center(
        child: Text('Selected Index: $_selectedIndex'),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF075E54),
        // Background color of the BottomNavigationBar
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          // Color of the selected item
          unselectedItemColor: Colors.white70,
          // Color of unselected items
          onTap: _onItemTapped,
          backgroundColor: Colors
              .transparent, // Makes the BottomNavigationBar transparent to show the container color
        ),
      ),
    );
  }
}