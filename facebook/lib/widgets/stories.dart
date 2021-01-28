import 'package:flutter/material.dart';
import '../models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.purple,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {}
        },
      ),
    );
  }
}
