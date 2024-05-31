import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';

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
  static const double expandedHeight = 300.0;
  static const double toolbarHeight = 75.0;
  double scrollPosition = 0.0;

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
      double scrollRange = expandedHeight - toolbarHeight;

      scrollPosition = (currentScrollOffset / scrollRange).clamp(0.0, 1.0);
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
              scrollPosition == 1.0,
              const CollapsedHeader(),
              null,
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: condition(
                scrollPosition <= 1,
                const ExpandedHeader(),
                null,
              ),
              background: Image.asset('assets/img/header-image.png', fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  width: 320,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Read more',
                          style: TextStyle(
                            color: Color(0xFFEF456F),
                            fontSize: 16,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                for (int i = 0; i < 50; i++) CustomContainer(index: i),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
