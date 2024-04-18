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
  late TextEditingController _baseTextfieldController;
  late TextEditingController _bigTextfieldController;

  @override
  void initState() {
    _baseTextfieldController = TextEditingController();
    _bigTextfieldController = TextEditingController();

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
                  BaseTextField(
                    controller: _baseTextfieldController,
                    labelText: 'Label',
                    onChanged: () {},
                  ),
                  const Space(),
                  BigTextField(
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
                      text: 'Title')
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
