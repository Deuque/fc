import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freshcut/style.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexSelected;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onIndexSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconPaths = [
      'hot_icon.png',
      'discover_icon.png',
      'watch_icon.png',
      'inbox_icon.png',
    ];
    final labels = [
      'Hot',
      'Discover',
      'Watch',
      'Inbox',
    ];
    return Material(
      color: Colors.black.withOpacity(.85),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 7.0,
            sigmaY: 7.0,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            onTap: onIndexSelected,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              color: lightOrange,
              fontWeight: FontWeight.w400,
              fontSize: 10,
              height: 13 / 10,
            ),
            selectedItemColor: lightOrange,
            unselectedItemColor: Colors.transparent,
            items: [
              ...List.generate(
                iconPaths.length,
                (index) {
                  final selected = selectedIndex == index;
                  return BottomNavigationBarItem(
                    backgroundColor: Colors.transparent,
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0, top: 14),
                      child: Image.asset(
                        'assets/images/${iconPaths[index]}',
                        color: selected ? lightOrange : grey1,
                      ),
                    ),
                    label: labels[index],
                  );
                },
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 6.0,
                    top: 14,
                  ),
                  child: _profileIcon(selectedIndex == 4),
                ),
                label: 'Profile',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileIcon(bool selected) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: selected ? lightOrange : grey1),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(1),
      child: Image.asset('assets/images/profile_icon.png'),
    );
  }
}
