import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

part 'image_handler_state.dart';
part 'image_handler_cubit.freezed.dart';

class ImageHandlerCubit extends Cubit<ImageHandlerState> {
  ImageHandlerCubit() : super(const ImageHandlerState.initial());

  File? image;

  final ImagePicker _picker = ImagePicker();

  Future<File?> setImage({
    bool fromOnline = false,
    String url = '',
  }) async {
    emit(const ImageHandlerState.loading());
    Logger().e(url);
    if (fromOnline) {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;
        File file = File('$tempPath${Random().nextInt(100)}.png');
        await file.writeAsBytes(response.bodyBytes);
        image = file;
      } else {
        emit(const ImageHandlerState.error());
        return null;
      }
    } else {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedImage == null) {
        emit(const ImageHandlerState.error());
        return null;
      }

      var croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
      );

      image = File(croppedFile!.path);
    }

    emit(const ImageHandlerState.loaded());
    return image;
  }

  void reset() async {
    emit(const ImageHandlerState.loading());
    image = null;
    emit(const ImageHandlerState.loaded());
  }
}
