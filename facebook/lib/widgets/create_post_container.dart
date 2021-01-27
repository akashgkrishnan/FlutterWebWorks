import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey[200],
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind',
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  label: Text('live'),
                  icon: const Icon(Icons.videocam, color: Colors.red),
                  onPressed: () {},
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                  label: Text('photo'),
                  icon: const Icon(Icons.photo_library, color: Colors.green),
                  onPressed: () {},
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                  label: Text('room'),
                  icon: const Icon(Icons.video_call, color: Colors.purpleAccent),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
