import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl =
      "https://image.bugsm.co.kr/album/images/500/151758/15175845.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          BackgroundCover(imageUrl),
          AlbumCover(imageUrl),
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
    return Container(
      child: Image.network(url),
    );
  }
}

class AlbumCover extends StatelessWidget {
  String url = '';

  AlbumCover(url) : this.url = url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(url),
    );
  }
}
