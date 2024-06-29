import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:aqari/modules/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';

/// ChangePassword is used to manage the change password screen
class ChangePassword extends StatelessWidget {
  /// ChangePassword is used to manage the change password screen
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xffF5f5f5),
      appBar: const CustomAppBar(titleText: 'Change Password',),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/gen/images/lockPassword.png'),
              ),
            ),
            const SizedBox(height: 50),
            CustomTextField(
              controller: controller,
              obscureText: true,
              hintText: 'Enter your current password',
              label: 'Current Password',
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: controller,
              obscureText: true,
              hintText: 'Enter your new password',
              label: 'New Password',
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: controller,
              obscureText: true,
              hintText: 'Re-enter your new password',
              label: 'Re-Enter Password',
            ),
            const SizedBox(height: 60),
            Hero(
              tag: 'button',
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                buttonText: 'Save',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
