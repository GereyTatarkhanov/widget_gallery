import 'package:flutter/material.dart';

import 'index.dart';

//Main Widget
class Carousel extends StatefulWidget {
  const Carousel(
      {super.key,
      required this.itemCount,
      required this.builder,
      this.padEnds = true,
      this.viewportFraction = 0.8,
      this.onPageChanged,
      this.width});

  final int itemCount;

  final double? width;
  final bool padEnds;
  final void Function(int index)? onPageChanged;
  final Widget Function(int index) builder;

  /// If you change [viewportFraction] value you need to do hot restart
  /// because the value is used in controller within the InitState function
  final double viewportFraction;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController controller;
  int _index = 0;

  @override
  void initState() {
    controller = PageController(viewportFraction: widget.viewportFraction);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      padEnds: widget.padEnds,
      itemCount: widget.itemCount,
      controller: controller,
      onPageChanged: (index) {
        setState(() {
          widget.onPageChanged?.call(index);
          _index = index;
        });
      },
      itemBuilder: (context, index) {
        return AnimatedPadding(
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            padding: EdgeInsets.all(_index == index ? 0.0 : 9.0),
            child: widget.builder.call(index));
      },
    );
  }
}
