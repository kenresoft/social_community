import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarExample extends StatefulWidget {
  const CustomAppBarExample({super.key});

  @override
  State<CustomAppBarExample> createState() => _CustomAppBarExampleState();
}

class _CustomAppBarExampleState extends State<CustomAppBarExample> {
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

class ExpandedHeader extends StatelessWidget {
  const ExpandedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 1.sw,
      color: const Color(0xFFC32422),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'The Weeknd',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: const Text(
                  'Community • +11K Members',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE9E9EB)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: SvgPicture.asset('assets/svg/share-outline.svg'),
          ),
        ],
      ),
    );
  }
}

class CollapsedHeader extends StatelessWidget {
  const CollapsedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFC32422),
      width: 1.sw,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Hero(
              tag: 'headerImage',
              child: Container(
                key: const ValueKey('circleAvatar'),
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFACB31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/header-image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Weeknd',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Community • +11K Members',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final int index;
  const CustomContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        'Custom Container #$index',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
