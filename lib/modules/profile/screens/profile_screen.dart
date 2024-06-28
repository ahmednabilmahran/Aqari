import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/utils/assets.dart';
import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/unit_card.dart';
import 'package:aqari/main.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// profile data
final profile = Profile(
  firstName: 'User',
  lastName: 'Name',
  email: '123',
  phone: '01023456789',
  image: Assets.genImagesTest1,
  sold: '1 Sold',
);

/// house data
const house = UnitCard(
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
        onBackButtonPressed: () async {
          await supabaseClient.auth.signOut();
          if (context.mounted) {
            await Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.loginRoute,
              (route) => false,
            );
          }
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.grey[200],
                height: 35.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
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
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedX.h2,
                    Text(
                      '${profile.firstName} ${profile.lastName}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedX.zero,
                    Text(
                      profile.phone,
                      style:
                          TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedX.h3,
              const CustomPadding(
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
                    Text(
                      profile.sold,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SingleChildScrollView(
                child: CustomPadding(
                  child: Row(
                    children: [
                      house,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///housecard =

class Profile {
  /// constructor
  Profile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
    required this.sold,
  });

  /// first name
  final String firstName;

  /// last name
  final String lastName;

  /// email
  final String email;

  /// phone
  final String phone;

  /// image
  final String image;

  /// sold
  final String sold;
}

/// customer container for listing and sold data
class CustomContainer extends StatelessWidget {
  /// constructor
  const CustomContainer({required this.number, required this.text, super.key});

  /// number
  final String number;

  /// text
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.sp,
      height: 55.sp,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
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
