import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_phone_number_text_field.dart';
import 'package:aqari/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';



/// SignUpScreen
class SignUpScreen extends StatefulWidget {
  /// constructor
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstName=TextEditingController();
  final TextEditingController  lastName=TextEditingController();
  final TextEditingController  email=TextEditingController();
  final TextEditingController  password=TextEditingController();
  final TextEditingController  phone=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:40 ,vertical:8 ),
          child: Column(
            children: [
              const SizedBox(height:100 ,),
              const Center(
                child: Text(
                  'Account Information',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right:10 ,top:16,bottom:16 ),
                      child: CustomTextField(
                          controller: firstName,
                        label: 'First name',
                        hintText: 'Enter Your First Name',
                        hintStyle: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:10,top:16,bottom:16 ),
                      child: CustomTextField(
                        controller: firstName,
                        label: 'Last name',
                        hintText: 'Enter Your Last Name',
                        hintStyle: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              CustomPhoneNumberTextField(controller: phone,label: 'Phone number',),
              const SizedBox(height: 20,),
              CustomTextField(
                controller: email,
                label: 'Email',
                hintText: 'Enter Your Email',
                hintStyle: const TextStyle(fontSize: 10),
              ),
              const SizedBox(height: 20,),
              CustomTextField(
                controller: password,
                label: 'password',
                hintText: 'Enter Your password',
                hintStyle: const TextStyle(fontSize: 10),
                obscureText: true,
              ),
              const SizedBox(height: 20,),
              CustomTextField(
                controller: password,
                label: 'confirm password',
                hintText: 'confirm your password',
                hintStyle: const TextStyle(fontSize: 10),
                obscureText: true,
              ),
              const SizedBox(height: 20,),
              CustomButton(onPressed: () {

              }, buttonText: 'Register',)
            ],
          ),
        ),
      ),
    );
  }
}
