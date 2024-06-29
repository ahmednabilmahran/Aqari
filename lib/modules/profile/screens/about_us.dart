import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/modules/profile/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// AboutUs is used to manage the About Us screen
class AboutUs extends StatelessWidget {
  /// AboutUs is used to manage the About Us screen
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(titleText: 'About Us',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Us',
              style: TextStyle(
                color: Color(0XFFB5854B),
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 24.h,
              width: 100.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/gen/images/about_us_cover.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const CustomListTile(
              image: 'assets/gen/images/icon_aqari.png',
              name: 'Project Overview',
              subtitle: 'Aqari revolutionizes real estate transactions '
                  'with seamless communication, and enhanced security. '
            ),
            const CustomListTile(
              image: 'assets/gen/images/icon_group.png',
              name: 'Our Team',
              subtitle: 'Meet Our Team of experts who have '
                  'years of experience in real estate.',
            ),
            const SizedBox(height: 15),
            const Text(
              'Our Team',
              style: TextStyle(
                color: Color(0XFFB5854B),
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25.h,
              width: 100.w,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => const CustomListTile(
                  image: 'assets/gen/images/image_team.png',
                  subtitle: 'Flutter Developer',
                  name: 'Ahmed Samy',
                ),
                separatorBuilder: (context, index) => SizedX.h2p5,
                itemCount: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

