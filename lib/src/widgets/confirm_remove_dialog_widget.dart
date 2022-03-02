import 'package:flutter/material.dart';

class ConfirmRemoveDialogWidget extends StatefulWidget {
  const ConfirmRemoveDialogWidget({
    Key? key,
    required this.onPressedRemove,
  }) : super(key: key);

  final void Function() onPressedRemove;

  @override
  State<ConfirmRemoveDialogWidget> createState() => _ConfirmRemoveDialogWidgetState();
}

class _ConfirmRemoveDialogWidgetState extends State<ConfirmRemoveDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tem certeza que deseja excluir ?'),
      actions: [
        TextButton(
          child: const Text('NÃO'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('SIM'),
          onPressed: () {
            widget.onPressedRemove();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
