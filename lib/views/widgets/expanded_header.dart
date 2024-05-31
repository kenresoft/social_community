import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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

