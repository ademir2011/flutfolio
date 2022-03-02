import 'package:flutfolio/src/widgets/confirm_remove_dialog_widget.dart';
import 'package:flutfolio/src/widgets/contact_form_dialog_widget.dart';
import 'package:flutter/material.dart';

class GenericShowDialog {
  static void showGenericFormDialog(
    BuildContext context, {
    isEdit = false,
    isRemove = false,
    String? docRef,
    required Future Function() onAction,
  }) {
    showDialog(
      context: context,
      builder: (ctx) {
        return isRemove
            ? ConfirmRemoveDialogWidget(onPressedRemove: onAction)
            : ContactFormDialogWidget(
                context: ctx,
                isEdit: isEdit,
                docRef: docRef,
                onPressed: onAction,
              );
      },
    );
  }
}
