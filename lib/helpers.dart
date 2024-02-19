import 'package:flutter/material.dart';

RelativeRect getDropdownMenuPosition(
    {required BuildContext context, required TapDownDetails details}) {
  final offset = details.globalPosition;
  final position = RelativeRect.fromLTRB(
    offset.dx,
    offset.dy,
    MediaQuery.of(context).size.width - offset.dx,
    MediaQuery.of(context).size.height - offset.dy,
  );
  return position;
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

extension SwappableList<T> on List<T> {
  void swap(int first, int second) {
    final temp = this[first];
    this[first] = this[second];
    this[second] = temp;
  }
}
