import 'package:flutter/material.dart';

class InheritedAdvanced<T extends ChangeNotifier> extends InheritedNotifier<T> {
  const InheritedAdvanced({
    super.key,
    required this.widget,
    required this.viewModel,
  }) : super(child: widget, notifier: viewModel);

  final Widget widget;
  final T viewModel;

  static T watch<T extends ChangeNotifier>(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<InheritedAdvanced<T>>()
        ?.notifier;
    return provider!;
  }

  static T read<T extends ChangeNotifier>(BuildContext context) {
    final element =
        context.getElementForInheritedWidgetOfExactType<InheritedAdvanced<T>>();
    final widget = element?.widget as InheritedAdvanced<T>;
    return widget.viewModel;
  }
}
