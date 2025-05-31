// views/bottom_bar_pages.dart
import 'package:chat_appilication/chat_view.dart';
import 'package:chat_appilication/screens/profile.dart';
import 'package:flutter/material.dart';


class BottomBarPages extends StatefulWidget {
  const BottomBarPages({super.key});

  @override
  State<BottomBarPages> createState() => _BottomBarPagesState();
}

class _BottomBarPagesState extends State<BottomBarPages> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ChatView(),
    const ProfileDetails()
  ];

  void _onTap(int index) {
    if (index == 1) {
      showOptionChat(); // Show dialog before going to ChatView
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void showOptionChat() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Choose Option"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text("New Chat"),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text("Join Community"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
