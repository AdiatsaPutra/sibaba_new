import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<File> downloadImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));

  if (response.statusCode == 200) {
    // Convert the response body to a Uint8List
    Uint8List bytes = response.bodyBytes;

    // Get the app's document directory
    String dir = (await getApplicationDocumentsDirectory()).path;

    // Create a File instance with the given file name
    File file = File('$dir/${Random().nextInt(9)}');

    // Write the bytes to the file
    await file.writeAsBytes(bytes);

    return file;
  } else {
    throw Exception('Failed to download image');
  }
}
