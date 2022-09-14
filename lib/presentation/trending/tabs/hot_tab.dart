import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freshcut/presentation/trending/widgets/playlist_card.dart';
import 'package:freshcut/style.dart';

class HotTab extends StatelessWidget {
  const HotTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TrendingTodayWidget(),
          SizedBox(
            height: 34,
          ),
          PlaylistCard(
            cardMainColor: lightOrange,
            title: 'Smash Stockpile',
            imagePath: 'assets/images/smash_stockpile.png',
          ),
          SizedBox(
            height: 34,
          ),
          PlaylistCard(
            cardMainColor: lightOrange,
            title: 'Smash Stockpile',
            imagePath: 'assets/images/smash_stockpile.png',
          ),
          SizedBox(
            height: 34,
          ),
          PlaylistCard(
            cardMainColor: lightOrange,
            title: 'Smash Stockpile',
            imagePath: 'assets/images/smash_stockpile.png',
          ),
        ],
      ),
    );
  }
}

class TrendingTodayWidget extends StatelessWidget {
  const TrendingTodayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          bottom: 0,
          child: Transform.translate(
            offset: const Offset(-6, 0),
            child: const Text(
              '🔥',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 14.0,
            sigmaY: 14.0,
          ),
          child: Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        lightOrange,
                        darkOrange,
                      ],
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: const Text(
                      'Trending Today',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const WidgetSpan(
                  child: Text(
                    ' 🔥',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
