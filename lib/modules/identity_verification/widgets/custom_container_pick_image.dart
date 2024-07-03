import 'dart:io';

import 'package:aqari/core/widgets/custom_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

/// CustomPickImageContainer is used to manage the custom pick image container
class CustomPickImageContainer extends StatefulWidget {
  /// CustomPickImageContainer is used to manage the custom pick image container
  const CustomPickImageContainer({super.key});

  @override
  State<CustomPickImageContainer> createState() =>
      _CustomPickImageContainerState();
}

class _CustomPickImageContainerState extends State<CustomPickImageContainer> {
  bool isLoading = false;
  FilePickerResult? result;
  String? imageUrl;
  PlatformFile? pickedFile;
  File? fileToDisplay;

  Future<void> pickImage() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (result != null) {
        imageUrl = result!.files.first.path;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path!);
        debugPrint(imageUrl);
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
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
            const SizedBox(height: 15),
            Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      onPressed: pickImage,
                      buttonText: 'Upload Image',
                    ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

/// DisplayImage is used to display the image
class DisplayImage extends StatelessWidget {
  /// Constructor
  const DisplayImage({
    required this.fileToDisplay,
    super.key,
  });

  /// fileToDisplay
  final File? fileToDisplay;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: fileToDisplay != null
          ? Image.file(
              fileToDisplay!,
              height: 40,
              width: 300,
            )
          : const Text('No image selected'),
    );
  }
}
