import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CollapsedHeader extends StatelessWidget {
  const CollapsedHeader({super.key, this.onBackClick});

  final void Function()? onBackClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: 1.sw,
      color: const Color(0xFFC32422),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onBackClick,
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20).r,
                    ),
                  ),
                  child: SvgPicture.asset('assets/svg/arrow-left.svg'),
                ),
              ),
              16.w.spX,
              Container(
                width: 50.w,
                height: 50.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFACB31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200).r,
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
              8.w.spX,
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Weeknd',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  6.h.spY,
                  Text(
                    'Community • +11K Members',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () => _showBottomSheet(context),
            child: Container(
              width: 24.w,
              height: 24.h,
              margin: EdgeInsets.only(right: 10.w),
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20).r,
                ),
              ),
              child: SvgPicture.asset('assets/svg/more.svg'),
            ),
          )
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15).r,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            24.h.spY,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/invite.svg'),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    debugPrint('Invite button clicked!');
                    Navigator.pop(context); 
                  },
                  child: Text(
                    'Invite',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            24.h.spY,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/add-member.svg'),
                8.w.spX,
                GestureDetector(
                  onTap: () {
                    debugPrint('Add member button clicked!');
                    Navigator.pop(context); 
                  },
                  child: Text(
                    'Add member',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            24.h.spY,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/add-group.svg'),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    debugPrint('Add Group button clicked!');
                    Navigator.pop(context); 
                  },
                  child: Text(
                    'Add Group',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            24.h.spY,
          ],
        ),
      );
    },
  );
}