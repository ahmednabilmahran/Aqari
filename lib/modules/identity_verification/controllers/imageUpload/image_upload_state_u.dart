part of 'image_upload_cubit.dart';

/// ImageUploadState
class ImageUploadState {
  /// Constructor
  ImageUploadState({this.imageID, this.imageFace});

  /// imageID
  final File? imageID;

  /// imageFace
  final File? imageFace;

  /// copyWith
  ImageUploadState copyWith({File? imageID, File? imageFace}) {
    return ImageUploadState(
      imageID: imageID ?? this.imageID,
      imageFace: imageFace ?? this.imageFace,
    );
  }
}
