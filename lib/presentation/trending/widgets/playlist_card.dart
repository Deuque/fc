import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freshcut/style.dart';

class PlaylistCard extends StatelessWidget {
  final Color cardMainColor;
  final String title, imagePath;

  const PlaylistCard({
    Key? key,
    required this.cardMainColor,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: RadialGradient(
          center: Alignment.topLeft,
          colors: [
            cardMainColor.withOpacity(.3),
            cardMainColor.withOpacity(.2),
          ],
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              darkBg.withOpacity(.5),
              darkBg.withOpacity(.8),
              darkBg,
            ],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4.0,
            sigmaY: 4.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _imageThumbnail(),
              Transform.translate(
                offset: const Offset(0, -16),
                child: _stats(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageThumbnail() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 32),
          child: Image.asset(imagePath),
        ),
        Positioned(
          right: 32,
          bottom: 0,
          child: Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white.withOpacity(.25),
              border: Border.all(color: Colors.grey[800]!),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20.0,
                  sigmaY: 20.0,
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 28.8,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _stats() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 25 / 20,
            ),
          ),
        ],
      ),
    );
  }
}
