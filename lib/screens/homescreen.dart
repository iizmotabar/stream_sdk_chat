// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stream_chat/pages/calls_page.dart';
import 'package:stream_chat/pages/contacts_page.dart';
import 'package:stream_chat/pages/messages_page.dart';
import 'package:stream_chat/pages/notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [
    MessagesPage(),
    CallsPage(),
    NotificationsPage(),
    ContactsPage()
  ];

  int currentPage = 0;

  changeScreen(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: pages[currentPage],
        ),
        bottomNavigationBar: BottomNavBar(
          onTabPressed: changeScreen(0),
        ));
  }
}

class BottomNavBar extends StatelessWidget {
  final Function onTabPressed;
  const BottomNavBar({
    Key? key,
    required this.onTabPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavBarItem(
              changeScreen: onTabPressed,
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
              index: 0,
              label: 'Messages'),
          BottomNavBarItem(
            changeScreen: onTabPressed,
            icon: CupertinoIcons.phone_fill,
            label: 'Calls',
            index: 1,
          ),
          BottomNavBarItem(
            changeScreen: onTabPressed,
            icon: CupertinoIcons.bell_fill,
            label: 'Notifications',
            index: 2,
          ),
          BottomNavBarItem(
            changeScreen: onTabPressed,
            icon: CupertinoIcons.person_2_fill,
            label: 'Contacts',
            index: 3,
          ),
        ],
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final String label;
  final Function changeScreen;
  const BottomNavBarItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.index,
    required this.changeScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeScreen(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
