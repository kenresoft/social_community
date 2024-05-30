import 'package:flutter/material.dart';

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => 300.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtent;
    final transformPercent = percent.clamp(0.0, 1.0);

    return Stack(
      fit: StackFit.expand,
      children: [
        // Image that fades out as we scroll up
        Opacity(
          opacity: 1 - transformPercent,
          child: Image.asset(
            'assets/img/header-image.png',
            fit: BoxFit.cover,
          ),
        ),
        // Card that moves up and becomes the app bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Transform.translate(
            offset: Offset(0, -shrinkOffset / 2),
            child: const Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Header Card Content',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Custom AppBar that fades in as we scroll up
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: kToolbarHeight,
            color: Colors.white.withOpacity(transformPercent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Header Card Content',
                    style: TextStyle(fontSize: 20.0 * transformPercent),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}