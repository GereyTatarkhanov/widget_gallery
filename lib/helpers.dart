import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

/// Returns a [RelativeRect] representing the position of a click relative to the [BuildContext].
///
/// The [context] parameter is required and represents the build context of the widget.
/// The [globalPositionOffset] parameter is required and represents the global offset of the click position.
///
/// To get the [globalPositionOffset] using `onTapDown` event in an `InkWell` or `GestureDetector`, you can use:
///
/// ```dart
/// RelativeRect position = getClickPosition(context: context, globalPositionOffset: details.globalPosition);
/// ```
/// Where `details` is the parameter provided in the `onTapDown` callback.
RelativeRect getClickPosition(
    {required BuildContext context, required Offset globalPositionOffest}) {
  final position = RelativeRect.fromLTRB(
    globalPositionOffest.dx,
    globalPositionOffest.dy,
    MediaQuery.of(context).size.width - globalPositionOffest.dx,
    MediaQuery.of(context).size.height - globalPositionOffest.dy,
  );
  return position;
}



/// Converts an image file to a base64 encoded string.
///
/// The [image] parameter is required and represents the image file to be converted.
/// The optional [imageType] parameter specifies the type of image (default is 'png').
/// ```dart
/// File imageFile = File('path/to/image.png');
/// String base64String = convertImageFileToBase64(imageFile, 'png');
/// ```
String convertImageFileToBase64(File image, [String imageType = 'png']) {
  final bytes = File(image.path).readAsBytesSync();
  final base64Image = base64Encode(bytes);
  final formattedBase64 = 'data:image/$imageType;base64,$base64Image';
  return formattedBase64;
}



/// Adds a character after the text in a TextField if the character is not already present.
/// 
/// The [character] parameter is the character to be added.
/// The [controller] parameter is the TextEditingController of the TextField.
/// 
/// This method listens for changes in the controller's text and adds the character if it's not already present.
/// It also ensures that the cursor stays in the correct position.
/// ```dart
/// TextEditingController textController = TextEditingController();
/// addCharacterAfterTextInTextField('@', textController);
/// ```
void addCharacterAfterTextInTextfield(
    String character, TextEditingController controller) {
  controller.addListener(() {
    final text = controller.text;
    if (!text.contains(character)) {
      controller.text += ' $character';
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length - 2),
      );
    }
    if (controller.selection.end == controller.text.length) {
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length - 2),
      );
    }
  });
}



/// An extension method to capitalize the first letter of a String.
/// 
/// This extension method can be used on String objects to capitalize the first letter.
/// ```dart
/// String word = 'hello';
/// String capitalizedWord = word.capitalize();
/// ```
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}



/// An extension method to swap elements at two indices in a List.
/// 
/// This extension method can be used on List objects to swap elements at the specified indices.
/// ```dart
/// List<int> numbers = [1, 2, 3, 4];
/// numbers.swap(0, 2);
/// ```
extension SwappableList<T> on List<T> {
  void swap(int first, int second) {
    final temp = this[first];
    this[first] = this[second];
    this[second] = temp;
  }
}
