import 'package:flutter/material.dart';
import 'inherited_advanced.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = ViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModelRead = InheritedAdvanced.read<ViewModel>(context);
    final viewModelWatch = InheritedAdvanced.watch<ViewModel>(context);
    return InheritedAdvanced(
      viewModel: viewModel,
      widget: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModelRead.increment();
          },
        ),
        body: Center(
          child: Text(
            viewModelWatch.counter.toString(),
          ),
        ),
      ),
    );
  }
}

class ViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }
}
