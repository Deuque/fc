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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: TrendingTodayWidget(),
          ),
          const SizedBox(
            height: 34,
          ),
          const PlaylistCard(
            cardMainColor: lightOrange,
            title: 'Smash Stockpile',
            imagePath: 'assets/images/smash_stockpile.png',
            newVideosCount: 10,
            watchCount: 5,
          ),
          const SizedBox(
            height: 34,
          ),
          const PlaylistCard(
            cardMainColor: Color(0xFFA823EA),
            title: 'FGC Rumble',
            imagePath: 'assets/images/fgc_rumble.png',
            newVideosCount: 18,
            watchCount: 0,
          ),
          const SizedBox(
            height: 34,
          ),
          const PlaylistCard(
            cardMainColor: Color(0xFFC30912),
            title: 'Valorant Volume',
            imagePath: 'assets/images/valorant_volume.png',
            newVideosCount: 21,
            watchCount: 21,
          ),
          const SizedBox(
            height: 46,
          ),
          Image.asset('assets/images/verification.png'),
          const Text(
            'Check back soon for new clips and creator content.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              height: 28 / 22,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'In the meantime join our discord.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: grey4,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 28 / 13,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56),
              border: Border.all(color: goldYellow.withOpacity(.2)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  goldYellow.withOpacity(.6),
                  goldYellow.withOpacity(.3),
                  goldYellow.withOpacity(.1),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Image.asset(
                    'assets/images/discord.png',
                    height: 16,
                  ),
                ),
                const SizedBox(
                  width: 9.5,
                ),
                const Text(
                  'Join Metaview Discord',
                  style: TextStyle(
                    fontSize: 17,
                    height: 22 / 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 100,
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
            sigmaX: 10.0,
            sigmaY: 10.0,
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
