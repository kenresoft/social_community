import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_community/utils/constants.dart';
import 'package:social_community/views/widgets/chips_widget.dart';
import 'package:social_community/views/widgets/community_options_widget.dart';

import 'widgets/collapsed_header.dart';
import 'widgets/custom_container.dart';
import 'widgets/expanded_header.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  static const double expandedHeight = 300.0;
  static const double toolbarHeight = 75.0;
  double scrollPosition = 0.0;
  bool _isSearching = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updatePercent);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updatePercent);
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _updatePercent() {
    final double currentScrollOffset = _scrollController.offset;
    const double scrollRange = expandedHeight - toolbarHeight;

    final newScrollPosition = (currentScrollOffset / scrollRange).clamp(0.0, 1.0);
    if (scrollPosition != newScrollPosition) {
      setState(() {
        scrollPosition = newScrollPosition;
      });
    }
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (_isSearching) {
        _animationController.forward();
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 10),
          curve: Curves.linear,
        );
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearching
          ? AppBar(
              toolbarHeight: toolbarHeight,
              titleSpacing: 0,
              title: CollapsedHeader(
                onBackClick: () => _toggleSearch(),
              ),
            )
          : null,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          if (!_isSearching)
            SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: expandedHeight,
              toolbarHeight: toolbarHeight,
              titleSpacing: 0,
              title: condition(
                scrollPosition == 1.0,
                CollapsedHeader(onBackClick: () {}),
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
          if (!_isSearching) ...[
            SliverToBoxAdapter(
              child: Container(
                width: 320.w,
                margin: const EdgeInsets.all(16).r,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: Constants.lorem,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Read more',
                        style: TextStyle(
                          color: const Color(0xFFEF456F),
                          fontSize: 16.sp,
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const ChipsWidget(),
            SliverToBoxAdapter(
              child: Container(
                width: 320.w,
                height: 24.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 32.h, bottom: 8.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Media, docs and links',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SvgPicture.asset('assets/svg/chevron-right.svg')
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 115,
                margin: const EdgeInsets.symmetric(horizontal: 16).w,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 110.w,
                      margin: EdgeInsets.only(right: 8.r),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6).r,
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/img/header-image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Mute notification',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 21.w,
                      height: 21.h,
                      margin: EdgeInsets.only(right: 24.w),
                      decoration: const ShapeDecoration(
                        color: Color(0xFFAAABAB),
                        shape: OvalBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const CommunityOptionsWidget(
              assetPath: 'assets/svg/trash.svg',
              text: 'Clear chat',
            ),
            const CommunityOptionsWidget(
              assetPath: 'assets/svg/lock.svg',
              text: 'Encryption',
            ),
            const CommunityOptionsWidget(
              assetPath: 'assets/svg/logout.svg',
              text: 'Exit community',
            ),
            const CommunityOptionsWidget(
              assetPath: 'assets/svg/dislike.svg',
              text: 'Report',
            ),
          ],
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!_isSearching) ...[
                    Text(
                      'Members',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: _toggleSearch,
                      child: Container(
                        width: 24.h,
                        height: 24.h,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE9E9EB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20).r,
                          ),
                        ),
                        child: SvgPicture.asset('assets/svg/search.svg'),
                      ),
                    )
                  ] else
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 38.h,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFE9E9EB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30).r,
                                ),
                              ),
                              child: TextField(
                                expands: true,
                                maxLines: null,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.fromLTRB(
                                    12.w,
                                    8.h,
                                    12.w,
                                    8.h,
                                  ),
                                  hintText: 'Search member',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: _toggleSearch,
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CustomContainer(index: index);
              },
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
