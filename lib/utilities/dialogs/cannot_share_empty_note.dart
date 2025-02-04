import 'package:flutter/material.dart';
import 'package:likh_lena_chahiye_tha/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      title: 'Sharing',
      content: 'You cannot share empty note...',
      optionsBuilder: () => {
            'OK': null,
          });
}
