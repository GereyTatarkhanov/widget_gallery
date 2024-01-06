import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionPanel extends StatelessWidget {
  const ActionPanel({super.key, required this.children, this.backgroundColor});

  final List<ActionPanelListTile> children;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: backgroundColor ??
                Theme.of(context).colorScheme.inversePrimary),
        child: Column(children: children));
  }
}

// ignore: must_be_immutable
class ActionPanelListTile extends StatelessWidget {
  ActionPanelListTile(
      {super.key,
      this.hasDivider = true,
      required this.svgName,
      required this.onPressed,
      required this.title});

  final String svgName;
  final VoidCallback onPressed;
  final String title;
  bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            color: Colors.transparent,
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.white,
              onTap: onPressed,
              // leading: SvgPicture.asset('${Constants.svgPath}$svgName'),
              leading: const Icon(Icons.flag),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ),
        ),
        hasDivider
            ? const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Divider(
                  endIndent: 5,
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
