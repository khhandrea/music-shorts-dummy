import 'dart:ui';

import "package:flutter/material.dart";
import 'package:music_shorts/widget/like_buttons.dart';
import 'package:music_shorts/widget/music_information.dart';
import 'package:music_shorts/widget/personal_buttons.dart';

class MusicSlide extends StatelessWidget {
  final String _imageUrl =
      // "https://image.bugsm.co.kr/album/images/500/222/22287.jpg"; // mm
      "https://image.bugsm.co.kr/album/images/500/151758/15175845.jpg"; // pch
  final String _title = "Peaches (feat.Daniel Caesar & Giveon)";
  final String _artist = "Justin Bieber, Daniel Caesar, Giveon";

  const MusicSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundCover(_imageUrl),
        AlbumCover(_imageUrl),
        Positioned(
          bottom: 0,
          child: MusicInformation(
            title: _title,
            artist: _artist,
          ),
        ),
        Positioned(
          right: 0,
          child: LikeButtons(),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: PersonalButtons(),
        ),
      ],
    );
  }
}

class BackgroundCover extends StatelessWidget {
  String url = '';

  BackgroundCover(url) : this.url = url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.black.withOpacity(0.1)),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00ffffff),
                  Color(0x88000000),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AlbumCover extends StatelessWidget {
  String url = '';

  AlbumCover(url) : this.url = url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.network(url),
    );
  }
}
