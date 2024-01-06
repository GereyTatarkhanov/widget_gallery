import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.maxLength = 60,
    this.keyboardType = TextInputType.text,
    this.isCharactersHidden = false,
    this.textColor = Colors.black,
    this.onSuffixIconPressed,
    this.isPhoneNumberTextField = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.isPasswordTextField = false,
    this.fillColor = Colors.white,
    this.bordersColor = Colors.grey,
    required this.controller,
    required this.labelText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String labelText;
  final int maxLength;
  final Color bordersColor;
  final Color fillColor;
  final Color textColor;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final bool isPhoneNumberTextField;
  final bool isPasswordTextField;
  final bool isCharactersHidden;
  final VoidCallback? onSuffixIconPressed;
  final VoidCallback onChanged;

  // final MaskTextInputFormatter phoneNumberFormatter =
  //     MaskTextInputFormatter(mask: '+7 (###) ###-##-##');

  //mask_text_input_formatter: ^2.7.0 - https://pub.dev/packages/mask_text_input_formatter

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: bordersColor)),
      child: TextField(
        textCapitalization: textCapitalization,
        maxLength: maxLength,
        keyboardType: keyboardType,
        inputFormatters:
            keyboardType == TextInputType.number && isPhoneNumberTextField
                // ? [phoneNumberFormatter]
                ? []
                : [],
        controller: controller,
        obscureText: isCharactersHidden,
        onChanged: (value) {
          onChanged();
        },
        style:
            Theme.of(context).textTheme.apply(bodyColor: textColor).bodyMedium,
        decoration: InputDecoration(
            counter: const SizedBox.shrink(),
            suffix: isPasswordTextField
                ? GestureDetector(
                    onTap: onSuffixIconPressed,
                    child: isCharactersHidden
                        ? const Icon(Icons.access_alarm_outlined)
                        : const Icon(Icons.abc),
                  )
                : const SizedBox(),
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
