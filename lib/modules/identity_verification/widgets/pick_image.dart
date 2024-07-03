import 'dart:io';

import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/modules/identity_verification/controllers/imageUpload/image_upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

/// UploadContainer
class UploadContainer extends StatelessWidget {
  /// Constructor
  const UploadContainer({
    required this.type,
    required this.cubitContext,
    super.key,
    this.image,
  });

  /// image
  final File? image;

  /// type
  final String type;

  /// cubitContext
  final ImageUploadCubit cubitContext;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return BlocProvider.value(
                value: cubitContext,
                child: CustomPadding(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedX.h0p5,
                      ListTile(
                        leading: Icon(
                          Icons.photo_library,
                          size: 22.sp,
                        ),
                        title: Text(
                          'photo_library',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 15.sp,
                                    color: Theme.of(context).primaryColor,
                                    letterSpacing: 0,
                                  ),
                        ),
                        onTap: () {
                          cubitContext.pickImage(ImageSource.gallery, type);
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedX.h1,
                      ListTile(
                        leading: Icon(
                          Icons.photo_camera,
                          size: 22.sp,
                        ),
                        title: Text(
                          'Camera',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 15.sp,
                                    color: Theme.of(context).primaryColor,
                                    letterSpacing: 0,
                                  ),
                        ),
                        onTap: () {
                          cubitContext.pickImage(ImageSource.camera, type);
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedX.h3,
                    ],
                  ),
                ),
              );
            },
          ),
          child: Container(
            width: double.infinity,
            height: 26.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: image == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
                            'Click bellow to upload an image',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const Center(
                          child: Text(
                            ' of your ID',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedX.h2,
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 19.75.w,
                          ),
                          child: CustomButton(
                            onPressed: () {},
                            buttonText: 'Upload Image',
                            isFilled: false,
                            notFillBackgroundColor:
                                Theme.of(context).primaryColor,
                            notFillTextColor: Colors.white,
                            borderColor: Theme.of(context).primaryColor,
                            //height: 5.h,
                            borderRadius: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  )
                : Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.sp),
                        child: Image.file(
                          image!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 1.5.h,
                        ),
                        child: SizedBox(
                          width: 32.5.w,
                          child: CustomButton(
                            onPressed: () => showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return BlocProvider.value(
                                  value: cubitContext,
                                  child: CustomPadding(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedX.h0p5,
                                        ListTile(
                                          leading: Icon(
                                            Icons.photo_library,
                                            size: 22.sp,
                                          ),
                                          title: Text(
                                            'photo_library',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontSize: 15.sp,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                          onTap: () {
                                            cubitContext.pickImage(
                                              ImageSource.gallery,
                                              type,
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        SizedX.h1,
                                        ListTile(
                                          leading: Icon(
                                            Icons.photo_camera,
                                            size: 22.sp,
                                          ),
                                          title: Text(
                                            'Camera',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontSize: 15.sp,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                          onTap: () {
                                            cubitContext.pickImage(
                                              ImageSource.camera,
                                              type,
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        SizedX.h3,
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            buttonText: 'reUpload',
                            fillBackgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            fillTextColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).primaryColor,
                            //height: 5.h,
                            borderRadius: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
