import 'package:aqari/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// SearchResultHeader widget to display the search term and result count.
class SearchResultHeader extends StatelessWidget {
  /// Constructor
  const SearchResultHeader({
    required this.searchTerm,
    required this.resultCount,
    super.key,
  });

  /// searchTerm
  final String searchTerm;

  /// resultCount
  final int resultCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Results for ',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeHelper.appColors.black,
                      letterSpacing: 0,
                    ),
              ),
              TextSpan(
                text: '"$searchTerm"',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 0,
                    ),
              ),
            ],
          ),
        ),
        Text(
          '$resultCount Found',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: ThemeHelper.appColors.black,
                letterSpacing: 0,
              ),
        ),
      ],
    );
  }
}
