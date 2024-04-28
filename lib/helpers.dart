import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

abstract final class Helpers {
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
  static RelativeRect getClickPosition(
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
  static String convertImageFileToBase64(File image,
      [String imageType = 'png']) {
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
  static void addCharacterAfterTextInTextfield(
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

/// Checks if the provided email is in a correct format.
///
/// This method takes a [String] email and validates it against a regular expression
/// to determine if it's a correctly formatted email address.
///
/// Returns a [bool] indicating whether the email is in the correct format.
/// 
/// Example usage:
/// ```dart
/// bool isEmailCorrect = checkIsEmailCorrect('example@email.com');
/// ```
  static bool checkIsEmailCorrect(String email) {
    final isEmailCorrect = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return isEmailCorrect;
  }
}
