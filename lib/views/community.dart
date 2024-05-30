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
  double percent = 0.0;
  bool showLeadingImage = false;

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
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      double currentScrollOffset = _scrollController.offset;
      double scrollRange = maxScrollExtent - kToolbarHeight;

      double newPercent = currentScrollOffset / scrollRange;
      percent = newPercent.clamp(0.0, 1.0);
      showLeadingImage = percent == 1.0;
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
            floating: true,
            expandedHeight: 300.0,
            toolbarHeight: 75,
            titleSpacing: 0,
            title: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: percent == 1.0 ? const CollapsedHeader() : null,
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: percent != 1.0 ? const ExpandedHeader() : null,
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