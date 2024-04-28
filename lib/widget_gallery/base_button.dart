import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.svgIconName,
    this.isEnabled = true,
    this.usePrefix = false,
    required this.text,
    required this.onPressed,
  });

  final bool isEnabled;
  final String text;
  final VoidCallback onPressed;
  final bool usePrefix;
  final String? svgIconName;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: ColorTween(
            end: isEnabled
                ? Theme.of(context).colorScheme.inversePrimary
                : Colors.grey.withOpacity(0.6)),
        duration: const Duration(milliseconds: 600),
        builder: (context, color, child) {
          return ElevatedButton(
              onPressed: isEnabled ? onPressed : null,
              style: ButtonStyle(
                overlayColor:
                    MaterialStatePropertyAll(Colors.black.withOpacity(0.1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(color),
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
              ));
        });
  }
}
