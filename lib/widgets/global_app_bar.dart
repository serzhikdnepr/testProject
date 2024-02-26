import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router/router.dart';

AppBar getGlobalAppBar(
    {required String text, List<Widget>? actions, bool needBackBtn = false, WidgetRef? ref}) {
  return AppBar(
    title: Text(text),
    leading: needBackBtn
        ? IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => ref?.read(appRouterProvider).pop(),
          )
        : null,
    centerTitle: true,
    elevation: 2,
    actions: actions,
  );
}
