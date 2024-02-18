import 'package:flutter/material.dart';

void showHotBottomSheet(
    {required BuildContext context,
    required Widget child,
    double topBorderRadius = 16,
    double paddingAll = 8,
    Color backgroundColor = Colors.white,
    Color dragHandleColor = Colors.black,
    bool isScrollControlled = true,
    bool useRootNavigator = false}) {
  showModalBottomSheet(
      useRootNavigator:
          useRootNavigator, // use root navigator in case of nested bottom sheets
      isScrollControlled: isScrollControlled,
      context: context,
      builder: (context) {
        return Material(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topBorderRadius),
              topRight: Radius.circular(topBorderRadius)),
          color: backgroundColor,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(paddingAll),
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 50,
                          height: 4,
                          decoration: BoxDecoration(
                              color: dragHandleColor,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      child
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
