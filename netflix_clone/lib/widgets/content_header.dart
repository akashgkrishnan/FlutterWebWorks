import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _ContentHeaderDesktop(featuredContent: featuredContent),
      mobile: _ContentHeaderMobile(featuredContent: featuredContent),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  const _ContentHeaderMobile({
    Key key,
    @required this.featuredContent,
  }) : super(key: key);

  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(featuredContent.imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'list',
                onTap: () {},
              ),
              _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'info',
                onTap: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  const _ContentHeaderDesktop({
    Key key,
    @required this.featuredContent,
  }) : super(key: key);

  final Content featuredContent;

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  VideoPlayerController _videoPlayerController;
  bool isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.featuredContent.videoUrl)
          ..initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.featuredContent.imageUrl),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(widget.featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'list',
                onTap: () {},
              ),
              _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'info',
                onTap: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      onPressed: () {},
      color: Colors.white,
      icon: const Icon(Icons.play_arrow),
      label: const Text(
        'play',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
