import 'package:flutter/material.dart';
import '../config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;

  const CustomTabBar({Key key, this.icons, this.selectedIndex, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(color: Palette.facebookBlue, width: 3.0),
        ),
      ),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: i == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
