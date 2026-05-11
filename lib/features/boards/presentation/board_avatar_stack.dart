import 'package:flutter/material.dart';

class BoardAvatarStack extends StatelessWidget {
  // TODO: updates based on user list from board API
  final int numUsers;

  const BoardAvatarStack({super.key, required this.numUsers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 110, // enough to fit all avatars without clipping
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(left: 0,  child: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'))),
          Positioned(left: 20, child: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=2'))),
          Positioned(left: 40, child: CircleAvatar(child: Text('+${numUsers - 2}'))),
        ],
      ),
    );
  }
}

