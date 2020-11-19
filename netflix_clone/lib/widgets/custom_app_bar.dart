import 'package:flutter/material.dart';
import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.orange,
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(
              width: 12.0,
            ),
            Row(
              children: [
                AppBarButton(
                  title: 'Tv shows',
                  onTap: () {},
                ),
                AppBarButton(
                  title: 'Tv shows',
                  onTap: () {},
                ),
                AppBarButton(
                  title: 'Tv shows',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
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
