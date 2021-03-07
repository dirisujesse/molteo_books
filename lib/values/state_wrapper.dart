import 'package:flutter/material.dart';
import 'package:molteo_books/models/config/app_config.dart';
import 'package:molteo_books/state/library_state.dart';
import 'package:provider/provider.dart';

class StateWrapper extends StatelessWidget {
  final Widget child;

  StateWrapper({
    @required this.child,
    bool isMock = true,
  }) {
    AppConfig.init(isMock: isMock);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (_) => LibraryState.instance,
        lazy: true,
      ),
    ],
      child: child,
    );
  }
}
