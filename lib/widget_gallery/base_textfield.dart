import 'package:flutter/material.dart';

class BaseTextField extends StatefulWidget {
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
    this.addCharacterAfterText = false,
    this.isErrorStateActive = false,
    this.characterAfterText,
    required this.controller,
    required this.labelText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String labelText;
  final String? characterAfterText;
  final int maxLength;
  final Color bordersColor;
  final Color fillColor;
  final Color textColor;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final bool isPhoneNumberTextField;
  final bool isPasswordTextField;
  final bool isCharactersHidden;
  final bool addCharacterAfterText;
  final bool isErrorStateActive;
  final VoidCallback? onSuffixIconPressed;
  final VoidCallback onChanged;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  // final MaskTextInputFormatter phoneNumberFormatter =
  //     MaskTextInputFormatter(mask: '+7 (###) ###-##-##');

  //mask_text_input_formatter: ^2.7.0 - https://pub.dev/packages/mask_text_input_formatter

  @override
  void initState() {
    super.initState();
    widget.addCharacterAfterText
        ? addCharacterAfterText(widget.characterAfterText ?? '*')
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      decoration: BoxDecoration(
          color: widget.fillColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: widget.isErrorStateActive
                  ? Colors.red
                  : widget.bordersColor)),
      child: TextField(
        textCapitalization: widget.textCapitalization,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.keyboardType == TextInputType.number &&
                widget.isPhoneNumberTextField
            // ? [phoneNumberFormatter]
            ? []
            : [],
        controller: widget.controller,
        obscureText: widget.isCharactersHidden,
        onChanged: (value) {
          widget.onChanged();
        },
        style: Theme.of(context)
            .textTheme
            .apply(
                bodyColor:
                    widget.isErrorStateActive ? Colors.red : widget.textColor)
            .bodyMedium,
        decoration: InputDecoration(
            counter: const SizedBox.shrink(),
            suffix: widget.isPasswordTextField
                ? GestureDetector(
                    onTap: widget.onSuffixIconPressed,
                    child: widget.isCharactersHidden
                        ? const Icon(Icons.access_alarm_outlined)
                        : const Icon(Icons.abc),
                  )
                : const SizedBox(),
            contentPadding: const EdgeInsets.only(top: 5),
            labelText: widget.labelText,
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

  void addCharacterAfterText(String character) {
    widget.controller.addListener(() {
      final text = widget.controller.text;
      if (!text.contains(character)) {
        widget.controller.text += ' $character';
        widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.controller.text.length - 2),
        );
      }
      if (widget.controller.selection.end == widget.controller.text.length) {
        widget.controller.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.controller.text.length - 2),
        );
      }
    });
  }
}
