import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:social_community/utils/extensions.dart';

import 'collapsed_header.dart';
import 'custom_container.dart';
import 'expanded_header.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  final ScrollController _scrollController = ScrollController();
  double position = 0.0;

  //bool showExpanded = true;
  ScrollDirection scrollDirection = ScrollDirection.idle;
  static const double expandedHeight = 300.0;
  static const double toolbarHeight = 75.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updatePercent);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updatePercent);
    _scrollController.dispose();
    super.dispose();
  }

  void _updatePercent() {
    setState(() {
      double currentScrollOffset = _scrollController.offset;
      scrollDirection = _scrollController.position.userScrollDirection;
      double scrollRange = expandedHeight - toolbarHeight;

      double range = currentScrollOffset / scrollRange;
      position = range.clamp(0.0, 1.0);

      /*if (scrollDirection == ScrollDirection.reverse && position != 1) {
        showExpanded = true;
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: expandedHeight,
            toolbarHeight: toolbarHeight,
            titleSpacing: 0,
            title: condition(
              position == 1.0,
              const CollapsedHeader(),
              null,
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: condition(
                /*showExpanded || */
                /*scrollDirection == ScrollDirection.forward ||*/ position <= 1,
                const ExpandedHeader(),
                null,
              ),
              background: Image.asset('assets/img/header-image.png', fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                for (int i = 0; i < 50; i++) CustomContainer(index: i),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
