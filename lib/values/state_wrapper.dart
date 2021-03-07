import 'package:flutter/material.dart';
import 'package:molteo_books/state/library_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class StateWrapper extends StatelessWidget {
  final Widget child;
  final List<SingleChildWidget> providers;

  const StateWrapper({
    @required this.child,
    this.providers,
  });

  List<SingleChildWidget> get defaultStates {
    return [
      ChangeNotifierProvider(
        create: (_) => LibraryState.instance,
        lazy: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers ?? defaultStates,
      child: child,
    );
  }
}
