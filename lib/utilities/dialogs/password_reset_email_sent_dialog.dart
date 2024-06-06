import 'package:flutter/material.dart';
import 'package:likh_lena_chahiye_tha/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentEmailDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password Reset',
    content: 'We have now sent you a password reset link. Please check email',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
