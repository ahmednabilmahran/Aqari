import 'package:aqari/core/utils/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// [MessageShimmerListViewItem]
class MessageShimmerListViewItem extends StatelessWidget {
  /// [MessageShimmerListViewItem] constructor
  const MessageShimmerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final androidColor = Colors.grey.shade100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoading(
          child: Container(
            width: double.infinity,
            height: 2.5.h,
            color: androidColor,
          ),
        ),
        SizedBox(height: 0.5.h),
        ShimmerLoading(
          child: Container(
            width: 40.w, // Adjust as needed
            height: 2.h,
            color: androidColor,
          ),
        ),
      ],
    );
  }
}
