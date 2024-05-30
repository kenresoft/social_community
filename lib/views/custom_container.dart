import 'package:flutter/material.dart';

import 'custom_header.dart';

class ExpandingAppBarList extends StatefulWidget {
  const ExpandingAppBarList({super.key});

  @override
  State<ExpandingAppBarList> createState() => _ExpandingAppBarListState();
}

class _ExpandingAppBarListState extends State<ExpandingAppBarList> {
  final ScrollController _controller = ScrollController();
  double _appBarOpacity = 1.0;

  final List<Widget> listItems = List.generate(
    20,
    (index) {
      return ListTile(
        title: Text('$index'),
      );
    },
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _appBarOpacity = 1.0 - (_controller.offset / 150).clamp(0.0, 1.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      /*body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomHeaderDelegate(),
            pinned: true,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item #$index'),
              ),
              childCount: 50,
            ),
          ),
        ],
      ),*/
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          _buildHeader(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => listItems[index],
              childCount: listItems.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SliverAppBar(
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Opacity(
            opacity: _appBarOpacity,
            child: Container(
              width: 360,
              height: 231,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/header-image.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Opacity(
              opacity: _appBarOpacity,
              child: const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "This is the card content",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      expandedHeight: 200,
      // Adjust header height
      backgroundColor: Colors.transparent.withOpacity(_appBarOpacity),
      title: Opacity(
        opacity: _appBarOpacity,
        child: const Text(
          "AThe weekend",
          style: TextStyle(),
        ),
      ),
    );
  }
}
