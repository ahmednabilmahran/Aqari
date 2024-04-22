
import 'package:aqari/core/utils/theme_helper.dart';
import 'package:aqari/core/widgets/custom_button.dart';
import 'package:aqari/core/widgets/custom_phone_number_text_field.dart';
import 'package:aqari/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/widgets/custom_text_field.dart';

/// LoginScreen
class LoginScreen extends StatefulWidget {
  /// constructor
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phone=TextEditingController();
  final TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: SingleChildScrollView(
       child: Container(
         height: 100.h,
         width: 100.w,
         decoration:  const BoxDecoration(
           image: DecorationImage(
             image:AssetImage('assets/gen/icons/background_image.jpg'),
             fit: BoxFit.cover
           )
         ),
         child: Column(
           children: [
             const SizedBox(height: 170,),
             Center(child: SvgPicture.asset(Assets.iconsLogoText),),
             Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:[
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 16),
                     child: Text('Login to access your account',style: TextStyle(
                       color: ThemeHelper.appColors.black,
                     ),),
                   ),
                 ]
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
               child: CustomPhoneNumberTextField(
                 controller:phone ,
                 label: 'Phone number',
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 32),
               child: CustomTextField(
                 controller:password ,
                 label: 'Password',
                 obscureText: true,
                 hintText: 'Enter Your Password',
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children:[
                 Padding(
                   padding: const EdgeInsets.only(right: 32),
                   child: Text('Forgot Password?',style: TextStyle(
                   color: ThemeHelper.appColors.black,
                                ),),
                 ),
               ]
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
               child: CustomButton(
                 buttonText: 'Login',
                 onPressed: () {  },
                 fillBackgroundColor: ThemeHelper.appColors.secondaryColor,


               ),
             ),
             Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:[
                   Text("Don't have an account?   ",style: TextStyle(
                     fontSize: 10.sp,
                     color: ThemeHelper.appColors.black,
                   ),),
                   GestureDetector(
                     onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.signUpRoute);
                     },
                     child: Text('Join Now ',style: TextStyle(
                       fontSize: 10.sp,
                       color: ThemeHelper.appColors.primaryColor,
                       fontWeight: FontWeight.bold
                     ),),
                   ),
                 ]
             ),

           ],
         ),
       ),
     ),
    );
  }
}
