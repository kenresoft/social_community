import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExpandedHeader extends StatelessWidget {
  const ExpandedHeader({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    // dev.log(animation.value.toString());
    return Container(
      height: 75.h,
      width: 1.sw,
      color: const Color(0xFFC32422),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final double space16 = Tween<double>(begin: 0, end: 16.w).evaluate(animation);
              final double space8 = Tween<double>(begin: 0, end: 8.w).evaluate(animation);
              final double space6 = Tween<double>(begin: 0, end: 6.h).evaluate(animation);
              final double arrowSize = Tween<double>(begin: 0, end: 24.w).evaluate(animation);
              final double imageSize = Tween<double>(begin: 0, end: 50.w).evaluate(animation);
              final double radius = Tween<double>(begin: 0, end: 200).evaluate(animation);

              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: animation.value,
                    child: Container(
                      width: arrowSize,
                      height: arrowSize,
                      decoration: ShapeDecoration(
                        color: Colors.black.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20).r,
                        ),
                      ),
                      child: SvgPicture.asset('assets/svg/arrow-left.svg'),
                    ),
                  ),
                  space16.spX,
                  Opacity(
                    opacity: animation.value,
                    child: Container(
                      width: imageSize,
                      height: imageSize,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFACB31),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius * animation.value).r,
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
                  space8.spX,
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
                      space6.spY,
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          'Community • +11K Members',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          Stack(
            children: [
              Opacity(
                opacity: 1.0 - animation.value,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.w, color: const Color(0xFFE9E9EB)),
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                  ),
                  child: SvgPicture.asset('assets/svg/share-outline.svg'),
                ),
              ),
              Opacity(
                opacity: animation.value,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}

