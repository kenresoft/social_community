import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipsWidget extends StatelessWidget {
  const ChipsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16).w,
        height: 20.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var i = 0; i < 4; ++i)
              Row(
                children: [
                  Container(
                    width: 66.w,
                    padding: const EdgeInsets.symmetric(horizontal: 6).w,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0xFFEF456F)),
                        borderRadius: BorderRadius.circular(20).r,
                      ),
                    ),
                    child: Text(
                      'Outdoor',
                      style: TextStyle(
                        color: const Color(0xFFEF456F),
                        fontSize: 12.sp,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            Container(
              width: 31.w,
              padding: const EdgeInsets.symmetric(horizontal: 6).w,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFEF456F)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                '+1',
                style: TextStyle(
                  color: const Color(0xFFEF456F),
                  fontSize: 12.sp,
                  fontFamily: 'Proxima Nova',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
