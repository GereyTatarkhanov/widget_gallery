import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigTextField extends StatelessWidget {
  const BigTextField(
      {super.key,
      this.height,
      required this.controller,
      required this.onChanged,
      required this.labelText});

  final TextEditingController controller;
  final Function() onChanged;
  final String labelText;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? MediaQuery.of(context).size.height * 0.16,
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      child: TextField(
        onChanged: (value) {
          onChanged();
        },
        maxLength: 150,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        maxLines: null,
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            counter: const SizedBox.shrink(),
            contentPadding: const EdgeInsets.only(top: 5),
            labelText: labelText,
            labelStyle: Theme.of(context)
                .textTheme
                .apply(
                  bodyColor: Colors.grey,
                )
                .bodyMedium,
            border: InputBorder.none),
      ),
    );
  }
}
