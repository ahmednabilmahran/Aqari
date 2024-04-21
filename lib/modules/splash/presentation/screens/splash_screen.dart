import 'package:aqari/core/utils/sized_x.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_padding.dart';
import 'package:aqari/core/widgets/custom_phone_number_text_field.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

/// SplashScreen
class SplashScreen extends StatelessWidget {
  /// constructor
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                controller: TextEditingController(),
                label: 'First Name',
                hintText: 'Enter your first name',
              ),
              SizedX.h2,
              CustomButton(
                onPressed: () {},
                buttonText: 'Login',
              ),
              SizedX.h2,
              CustomPhoneNumberTextField(
                controller: TextEditingController(),
                label: 'Phone Number',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
