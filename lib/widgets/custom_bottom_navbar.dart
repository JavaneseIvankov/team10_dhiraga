import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blueGrey,
      backgroundColor: Colors.white,
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildBottomNavigationBarItem(
          icon: Icons.home,
          label: 'Home',
          index: 0,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.event,
          label: 'Event',
          index: 1,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.people,
          label: 'Mentoring',
          index: 2,
        ),
        _buildBottomNavigationBarItem(
          icon: Icons.person,
          label: 'Profile',
          index: 3,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Icon(icon),
          if (currentIndex == index)
            Positioned(
              bottom: -5,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}
