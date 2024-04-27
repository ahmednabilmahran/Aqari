import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../utils/theme_helper.dart';

class CustomeCardApartment extends StatelessWidget {
  const CustomeCardApartment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.sp),
                topRight: Radius.circular(8.sp),
              ),
            ),
            child: const Image(
              image: AssetImage(
                'assets/gen/images/test1.jpeg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.sp),
                  bottomRight: Radius.circular(8.sp),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Lorem House',
                      style: TextStyle(
                          color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      '\$xxx.xxx',
                      style: TextStyle(
                          color: ThemeHelper.appColors.primaryColor,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 15,
                        ),
                        ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 80),
                            child: Text(
                              'AvenueSsssssssssssss, West Side',
                              style: TextStyle(color: Colors.grey, fontSize: 8, overflow: TextOverflow.ellipsis),
                            )),
                        SizedBox(
                          width: 8.w,
                        ),
                        Icon(
                          Icons.ac_unit,
                          color: ThemeHelper.appColors.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12)
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
