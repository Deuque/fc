import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshcut/presentation/trending/tabs/hot_tab.dart';
import 'package:freshcut/presentation/trending/widgets/bottom_nav_bar.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          const HotTab(),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(
              selectedIndex: _index,
              onIndexSelected: (val) {
                setState(() {
                  _index = val;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
