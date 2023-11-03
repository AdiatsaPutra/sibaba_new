import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'image_handler_state.dart';
part 'image_handler_cubit.freezed.dart';

class ImageHandlerCubit extends Cubit<ImageHandlerState> {
  ImageHandlerCubit() : super(const ImageHandlerState.initial());

  File? image;

  final ImagePicker _picker = ImagePicker();

  Future<File?> setImage() async {
    emit(const ImageHandlerState.loading());
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImage!.path,
      // androidUiSettings: const AndroidUiSettings(
      //     toolbarTitle: 'Cropper',
      //     toolbarColor: primaryColor,
      //     toolbarWidgetColor: Colors.white,
      //     initAspectRatio: CropAspectRatioPreset.original,
      //     lockAspectRatio: false),
      // iosUiSettings: const IOSUiSettings(
      //   minimumAspectRatio: 1.0,
      // ),
    );
    image = File(croppedFile!.path);
    emit(const ImageHandlerState.loaded());
    return image;
  }

  void reset() async {
    emit(const ImageHandlerState.loading());
    image = null;
    emit(const ImageHandlerState.loaded());
  }
}
