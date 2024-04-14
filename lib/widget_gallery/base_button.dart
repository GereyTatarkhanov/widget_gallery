import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.svgIconName,
    this.isEnabled = true,
    this.usePrefix = false,
    this.useAnimation = true,
    required this.text,
    required this.onPressed,
  });

  final bool isEnabled;
  final String text;
  final VoidCallback onPressed;
  final bool usePrefix;
  final bool useAnimation;
  final String? svgIconName;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: ColorTween(
            begin: Colors.grey.withOpacity(0.6),
            end: isEnabled
                ? Theme.of(context).colorScheme.inversePrimary
                : Colors.grey.withOpacity(0.6)),
        duration: Duration(milliseconds: useAnimation ? 800 : 0),
        builder: (context, color, child) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color),
            child: ElevatedButton(
                onPressed: isEnabled ? onPressed : null,
                style: ButtonStyle(
                  overlayColor:
                      MaterialStatePropertyAll(Colors.black.withOpacity(0.1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.transparent),
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
        });
  }
}
