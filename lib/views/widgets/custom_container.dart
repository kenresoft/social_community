import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatefulWidget {
  final int index;
  const CustomContainer({super.key, required this.index});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool _isFollowing = false;

  @override
  void initState() {
    super.initState();
    _loadFollowStatus();
  }

  void _loadFollowStatus() async {
    setState(() {
      _isFollowing =
          SharedPreferencesService.getBool('isFollowing_${widget.index}') ??
              false;
    });
  }

  void _toggleFollow() async {
    setState(() => _isFollowing = !_isFollowing);
    SharedPreferencesService.setBool(
        'isFollowing_${widget.index}', _isFollowing);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 46.h,
                height: 46.h,
                decoration: const ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: OvalBorder(),
                  image: DecorationImage(
                    image: AssetImage('assets/img/profile-image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              12.w.spX,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yashika',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '29, India',
                    style: TextStyle(
                      color: const Color(0xFF494949),
                      fontSize: 12.sp,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          FilledButton(
            onPressed: _toggleFollow,
            style: FilledButton.styleFrom(
              backgroundColor:
                  _isFollowing ? Colors.grey : const Color(0xffEF456F),
              minimumSize: Size(101.w, 32.h),
              padding: EdgeInsets.zero,
            ),
            child: Text(
              _isFollowing ? 'Following' : 'Add',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
