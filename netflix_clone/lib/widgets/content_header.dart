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
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoPlayerController.value.isPlaying
          ? _videoPlayerController.pause()
          : _videoPlayerController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            left: 0,
            bottom: -1,
            right: 0,
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.initialized
                  ? _videoPlayerController.value.aspectRatio
                  : 2.344,
              child: _videoPlayerController.value.initialized
                  ? VideoPlayer(_videoPlayerController)
                  : Image.asset(
                      widget.featuredContent.imageUrl,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          AspectRatio(
            aspectRatio: _videoPlayerController.value.initialized
                ? _videoPlayerController.value.aspectRatio
                : 2.344,
            child: Container(
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
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(widget.featuredContent.titleImageUrl),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.featuredContent.description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.4,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2.0, 4.0),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    _PlayButton(),
                    const SizedBox(
                      width: 16.0,
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline),
                      label: const Text(
                        'info',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    if (_videoPlayerController.value.initialized)
                      IconButton(
                        icon:
                            Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            isMuted
                                ? _videoPlayerController.setVolume(100)
                                : _videoPlayerController.setVolume(0);

                            isMuted = _videoPlayerController.value.volume == 0;
                          });
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: !Responsive.isDesktop(context)
          ? const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
          : const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
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
