import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freshcut/style.dart';

class PlaylistCard extends StatelessWidget {
  final Color cardMainColor;
  final String title, imagePath;
  final int newVideosCount, watchCount;

  const PlaylistCard({
    Key? key,
    required this.cardMainColor,
    required this.title,
    required this.imagePath,
    required this.newVideosCount,
    required this.watchCount,
  })  : assert(watchCount >= 0 && watchCount <= newVideosCount),
        super(key: key);

  Color get newVideosCountColor => watchProgress < 1 ? lightOrange : grey2;

  Color get watchCountColor => watchProgress > 0 ? grey3 : lightOrange;

  double get watchProgress => (watchCount == 0 || newVideosCount == 0)
      ? 0
      : (watchCount / newVideosCount);

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
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Text(
                '+$newVideosCount New Videos',
                style: TextStyle(
                  color: newVideosCountColor,
                  fontSize: 12,
                  height: 16 / 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Icon(
                  Icons.remove_red_eye_outlined,
                  color: watchCountColor,
                  size: 12,
                ),
              ),
              const SizedBox(
                width: 3.5,
              ),
              Text(
                '$watchCount/$newVideosCount',
                style: TextStyle(
                  color: watchCountColor,
                  fontSize: 12,
                  height: 16 / 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          _progressBar(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _progressBar() {
    return Stack(
      children: [
        Container(
          height: 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.1),
            borderRadius: BorderRadius.circular(4),
          ),
          clipBehavior: Clip.antiAlias,
        ),
        LayoutBuilder(
          builder: (_, constraint) {
            final width = constraint.maxWidth * watchProgress;
            return Align(
              alignment: Alignment.topLeft,
              child: Stack(
                children: [
                  if (watchProgress > 0 && watchProgress < 1)
                    SizedBox(
                      width: width,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Transform.translate(
                          offset: const Offset(5, 0),
                          child: Container(
                            width: 13,
                            height: 6,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(.4),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  Container(
                    width: width,
                    height: 4,
                    decoration: BoxDecoration(
                      color: watchProgress < 1 ? null : lightOrange,
                      gradient: watchProgress == 1
                          ? null
                          : const LinearGradient(
                              stops: [0, 0.95, 0.98],
                              colors: [
                                lightOrange,
                                lightOrange,
                                Colors.white,
                              ],
                            ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
