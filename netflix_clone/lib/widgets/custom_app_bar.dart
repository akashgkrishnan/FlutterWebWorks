import 'package:flutter/material.dart';
import '../assets.dart';
import '../widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(
                  title: 'Tv shows',
                  onTap: () {},
                ),
                AppBarButton(
                  title: 'movies',
                  onTap: () {},
                ),
                AppBarButton(
                  title: 'my list',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(
                  title: 'home',
                  onTap: () {},
                ),
                AppBarButton(
                  title: 'Tv shows',
                  onTap: () {},
                ),
                AppBarButton(
                  title: 'movies',
                  onTap: () {},
                ),
                AppBarButton(
                  title: 'my list',
                  onTap: () {},
                ),
                AppBarButton(
                  title: 'latest',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
                AppBarButton(
                  title: 'kids',
                  onTap: () {},
                ),
                AppBarButton(
                  title: 'dvd',
                  onTap: () {},
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.card_giftcard,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const AppBarButton({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Text(
        this.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
