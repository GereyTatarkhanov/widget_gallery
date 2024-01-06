import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.svgIconName,
    this.usePrefix = false,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;
  final bool usePrefix;
  final String? svgIconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.inversePrimary),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(
                Theme.of(context).primaryColor.withOpacity(0.1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 14)),
            elevation: const MaterialStatePropertyAll(0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              usePrefix
                  // ? SvgPicture.asset('${Constants.svgPath}$svgIconName')
                  ? const Icon(Icons.abc)
                  : const SizedBox(),
              const SizedBox(width: 4),
              //AutoSizeText
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )),
    );
  }
}
