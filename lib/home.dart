import 'package:flutter/material.dart';
import 'widget_gallery/index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController _baseTextfieldController;
  late final TextEditingController _bigTextfieldController;
  late final List<String> carouselItems;

  @override
  void initState() {
    _baseTextfieldController = TextEditingController();
    _bigTextfieldController = TextEditingController();
    carouselItems = List<String>.generate(10, (index) => 'Item $index');
    super.initState();
  }

  @override
  void dispose() {
    _baseTextfieldController.dispose();
    _bigTextfieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text(
              'Widget Gallery',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BaseTextfield(
                    controller: _baseTextfieldController,
                    labelText: 'Label',
                    onChanged: () {},
                  ),
                  const Space(),
                  BigTextfield(
                    controller: _bigTextfieldController,
                    labelText: 'Label',
                    onChanged: () {},
                  ),
                  const Space(),
                  BaseButton(
                    text: 'Button',
                    onPressed: () {},
                  ),
                  const Space(),
                  ActionPanel(
                      children: List<ActionPanelListTile>.generate(
                    3,
                    (index) => ActionPanelListTile(
                        svgName: 'Need to add svg picture name',
                        onPressed: () {},
                        title: 'Title',
                        hasDivider: index != 2),
                  )),
                  const Space(),
                  const ArcProgressBar(
                      backgroundLineWidth: 5.5,
                      foregroundLineWidth: 7,
                      width: 400,
                      height: 500,
                      indent: 0.3,
                      fillingPercentage: 75),
                  const Space(),
                  ContainerWithButton(
                      onPressed: (details) {},
                      useHintText: true,
                      useIconButton: true,
                      hintText: 'Hint text',
                      text: 'Title'),
                  const Space(),
                  Carousel(
                    height: 200,
                    itemCount: carouselItems.length,
                    viewportFraction: 0.9,
                    builder: (index) {
                      return Card(
                        color: theme.colorScheme.inversePrimary,
                        elevation: 2,
                        child: Center(
                          child: Text(
                            carouselItems[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class Space extends StatelessWidget {
  const Space({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}
