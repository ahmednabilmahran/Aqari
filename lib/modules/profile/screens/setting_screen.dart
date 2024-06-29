import 'package:aqari/config/routes/app_routes.dart';
import 'package:aqari/core/widgets/custom_app_bar.dart';
import 'package:aqari/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

/// this class is the setting screen
class SettingScreen extends StatefulWidget {
  /// this class is the setting screen
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: const CustomAppBar(
        titleText: 'Settings',
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                height: 160,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            navigatorKey.currentContext!,
                            Routes.editProfile,
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            navigatorKey.currentContext!,
                            Routes.changePassword,
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.lock),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Change Password',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ), //Account Settings
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                height: 160,
                width: 400,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preferences',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.language, color: Colors.lightBlueAccent),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Country',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Egypt',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.translate_sharp, color: Color(0XFFB5854B)),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Language',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Spacer(),
                          Text(
                            'English',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ), //Preferences
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                height: 32.h,
                width: 400.w,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Application settings',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            navigatorKey.currentContext!,
                            Routes.termsAndConditions,
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.fileLines,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.light_mode_outlined,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const Spacer(),
                          CupertinoSwitch(
                            // This bool value toggles the switch.
                            value: switchValue,

                            activeColor: CupertinoColors.activeBlue,
                            onChanged: (bool? value) {
                              setState(() {
                                switchValue = value ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            navigatorKey.currentContext!,
                            Routes.aboutUs,
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.perm_contact_cal_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'About Us',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          await supabaseClient.auth.signOut();
                          if (context.mounted) {
                            await Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.loginRoute,
                              (route) => false,
                            );
                          }
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.exit_to_app_outlined, color: Colors.red),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Log out',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ), //Application settings
          ],
        ),
      ),
    );
  }
}
