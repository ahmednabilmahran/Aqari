import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_upload_state_u.dart';

/// ImageUploadCubit
class ImageUploadCubit extends Cubit<ImageUploadState> {
  /// Constructor
  ImageUploadCubit() : super(ImageUploadState());
  final ImagePicker _picker = ImagePicker();

  /// pickImage
  Future<void> pickImage(ImageSource source, String type) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      if (type == 'ID') {
        emit(state.copyWith(imageID: File(pickedFile.path)));
      } else {
        emit(state.copyWith(imageFace: File(pickedFile.path)));
      }
    }
  }
}
