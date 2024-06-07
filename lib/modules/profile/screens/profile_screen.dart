import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/aqari_app_bar.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/modules/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// profile data
final profile = Profile(
    firstName: 'User',
    lastName: 'Name',
    email: '123',
    phone: '01023456789',
    image: Assets.genImagesTest1,
    sold: '1 Sold');
// house data
final house = HouseCard(
  imagePath: Assets.genImagesTest1,
  title: 'Lorem House',
  details: '4 Beds | 4 Baths',
);

/// ProfileScreen
class ProfileScreen extends StatelessWidget {
  /// constructor
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Profile',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.grey[200],
              height: 35.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    CircleAvatar(
                      radius: 50.sp,
                      backgroundImage: AssetImage(profile.image),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15.sp,
                        backgroundColor: Theme.of(context).primaryColor,
                        child:
                            Icon(Icons.edit, color: Colors.white, size: 15.sp),
                      ),
                    ),
                  ]),
                  SizedX.h2,
                  Text('${profile.firstName} ${profile.lastName}',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold)),
                  SizedX.zero,
                  Text(profile.phone,
                      style:
                          TextStyle(fontSize: 10.sp, color: Colors.grey[600])),
                ],
              ),
            ),
            SizedX.h3,
            CustomPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(number: '3', text: 'Listing'),
                  CustomContainer(number: '1', text: 'Sold'),
                ],
              ),
            ),
            CustomPadding(
              child: Row(
                children: [
                  Text(profile.sold,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SingleChildScrollView(
              child: CustomPadding(
                child: Row(
                  children: [
                    house,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//housecard =

class Profile {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String image;
  final String sold;
  Profile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
    required this.sold,
  });
}

// customer container for listing and sold data
class CustomContainer extends StatelessWidget {
  final String number;
  final String text;

  CustomContainer({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.sp,
      height: 55.sp,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 8.sp),
          ),
        ],
      ),
    );
  }
}
