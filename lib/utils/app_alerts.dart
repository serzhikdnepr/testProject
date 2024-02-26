import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/item.dart';
import '../generated/l10n.dart';
import '../providers/item/item.dart';
import '../router/router.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  static Future<void> showAlertDeleteDialog({
    required BuildContext context,
    required WidgetRef ref,
    required Item item,
  }) async {
    Widget cancelButton = TextButton(
      child:   Text(S.current.no),
      onPressed: () {
        if(context.mounted){
          ref.read(appRouterProvider).pop();
        }
      },
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(itemsProvider.notifier).deleteItem(item).then(
          (value) {
            displaySnackbar(
              context,
              S.current.objectDeletedSuccessfully,
            );
            if(context.mounted){
              ref.read(appRouterProvider).pop();
            }
          },
        );
      },
      child:   Text(S.current.yes),
    );

    AlertDialog alert = AlertDialog(
      title:   Text(S.current.deleteThisItem),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );

    await showDialog(
      context: context,useRootNavigator: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
