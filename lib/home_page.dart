import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _imageUrl =
      "https://image.bugsm.co.kr/album/images/500/151758/15175845.jpg";
  final String _title = "Peaches (feat.Daniel Caesar & Giveon)";
  final String _artist = "Justin Bieber, Daniel Caesar, Giveon";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
        ],
      ),
    );
  }
}

class BackgroundCover extends StatelessWidget {
  String url = '';

  BackgroundCover(url) : this.url = url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(color: Colors.black.withOpacity(0.1)),
        ),
      ),
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

class MusicInformation extends StatelessWidget {
  String title;
  String artist;

  MusicInformation({
    Key? key,
    required this.title,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffffffff),
              ),
            ),
            Text(
              artist,
              style: TextStyle(
                fontSize: 12,
                color: Color(0x888888ff),
              ),
            ),
            SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}
