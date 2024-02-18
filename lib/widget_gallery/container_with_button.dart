// ignore: must_be_immutable
import 'package:flutter/material.dart';

class ContainerWithButton extends StatelessWidget {
  const ContainerWithButton(
      {super.key,
      this.useIconButton = true,
      this.verticalPadding = 4.5,
      this.rightPadding = 0,
      this.leftPadding = 12,
      required this.onPressed,
      required this.useHintText,
      required this.hintText,
      required this.text});

  final Function(TapDownDetails details) onPressed;
  final String text;
  final bool useHintText;
  final String hintText;
  final bool useIconButton;
  final double verticalPadding;
  final double rightPadding;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
          top: verticalPadding,
          bottom: verticalPadding,
          left: leftPadding,
          right: rightPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedCrossFade(
                    firstChild: Text(hintText,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                    secondChild: const SizedBox.shrink(),
                    crossFadeState: useHintText
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 600)),
                //AutoSizeText is better here
                Text(
                  text,
                  style: theme.textTheme.bodyLarge,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          InkWell(
              borderRadius: BorderRadius.circular(100),
              onTapDown: useIconButton ? onPressed : null,
              child: AnimatedOpacity(
                opacity: useIconButton ? 1 : 0,
                duration: const Duration(milliseconds: 800),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.alarm,
                    color: theme.primaryColor,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
