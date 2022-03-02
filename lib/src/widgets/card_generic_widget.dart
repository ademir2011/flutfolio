import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutfolio/src/stores/theme_store.dart';

class CardGenericWidget extends StatelessWidget {
  final themeStore = GetIt.I<ThemeStore>();

  final Widget child;
  CardGenericWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardTheme.color,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        boxShadow: themeStore.typeTheme == TypeTheme.light
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(1, 1),
                )
              ]
            : null,
      ),
      child: child,
    );
  }
}
