import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';

/// TermsAndConditionsScreen
class TermsAndConditionsScreen extends StatelessWidget {
  /// TermsAndConditionsScreen
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Terms & Conditions',),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            'Introduction',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Welcome to Aqari! These Terms and Conditions govern your use of our real estate platform. By accessing or using Aqari, you agree to comply with and be bound by these terms.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 16),
          Text(
            '1. Use of the Platform',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '1.1 Eligibility:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            'You must be at least 18 years old to use Aqari. By using our platform, you confirm that you meet this age requirement.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            '1.2 Account Responsibility:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            'You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account. Notify us immediately of any unauthorized use of your account.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 16),
          Text(
            '2. User Conduct',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '2.1 Prohibited Activities: Users are prohibited from:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            '• Posting false, misleading, or fraudulent information.\n'
            '• Violating any laws or regulations.\n'
            '• Uploading harmful or malicious content, including viruses and malware.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            '2.2 Termination:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            'Aqari reserves the right to suspend or terminate your account if you violate these terms.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 16),
          Text(
            '3. Property Listings',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '3.1 Accuracy:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            'Property listings must be accurate and up-to-date. Aqari is not responsible for any inaccuracies in property listings.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            '3.2 Compliance:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            'All property listings must comply with relevant laws and regulations. It is the responsibility of the property owner or agent to ensure compliance.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 16),
          Text(
            '4. Privacy',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '4.1 Data Collection:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            'Aqari collects and uses personal information in accordance with our Privacy Policy. By using the platform, you consent to the collection and use of your information as outlined in the Privacy Policy.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            '4.2 Confidentiality:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            'Aqari employs measures to protect the confidentiality and security of user information. However, we cannot guarantee absolute security and encourage users to take appropriate precautions.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 16),
          Text(
            '5. Changes to Terms',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Aqari reserves the right to modify these Terms and Conditions at any time. We will notify users of any changes by posting the updated terms on our platform. Continued use of Aqari after such changes constitutes acceptance of the new terms.',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
