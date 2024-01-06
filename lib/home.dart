import 'package:flutter/material.dart';
import 'package:widget_gallery/widget_gallery/action_panel.dart';
import 'package:widget_gallery/widget_gallery/base_button.dart';
import 'package:widget_gallery/widget_gallery/base_textfield.dart';
import 'package:widget_gallery/widget_gallery/big_textfield.dart';

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
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                BaseTextField(
                  controller: _baseTextfieldController,
                  labelText: 'Label',
                  onChanged: () {},
                ),
                const Spacer(),
                BigTextField(
                  controller: _bigTextfieldController,
                  labelText: 'Label',
                  onChanged: () {},
                ),
                const Spacer(),
                BaseButton(
                  text: 'Button',
                  onPressed: () {},
                ),
                const Spacer(),
                ActionPanel(
                    children: List<ActionPanelListTile>.generate(
                  3,
                  (index) => ActionPanelListTile(
                      svgName: 'Need to add svg picture name',
                      onPressed: () {},
                      title: 'Title',
                      hasDivider: index != 2),
                )),
                const Spacer(),
              ],
            ),
          )),
    );
  }
}
