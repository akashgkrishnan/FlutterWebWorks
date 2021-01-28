import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../models/models.dart';
import 'widgets.dart';
import '../config/palette.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 4.0),
                Text(post.caption),
                post.imageUrl == null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6.0),
              ],
            ),
          ),
          if (post.imageUrl != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CachedNetworkImage(imageUrl: post.imageUrl),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} .',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ),
        Icon(Icons.more_horiz)
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${post.comments} comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${post.shares} shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(MdiIcons.thumbUpOutline,
                  color: Colors.grey[600], size: 20.0),
              label: 'like',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(MdiIcons.commentOutline,
                  color: Colors.grey[600], size: 20.0),
              label: 'comment',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(MdiIcons.shareOutline,
                  color: Colors.grey[600], size: 25.0),
              label: 'share',
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final Function onTap;
  final String label;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.onTap,
    @required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4.0,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
