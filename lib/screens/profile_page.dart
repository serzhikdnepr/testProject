import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/widgets/widgets.dart';

import '../main.dart';
import '../providers/providers.dart';
import '../generated/l10n.dart';
import '../router/router.dart';
import '../router/router.gr.dart';
import '../utils/utils.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // first variable is to get the data of Authenticated User
    final data = ref.watch(fireBaseAuthProvider);

    final authState = ref.watch(authStateProvider);
    final auth = ref.watch(authenticationProvider);
    if (data.currentUser == null) {
      prefs.setBool(AppKeys.isUserRegister, false);
      ref.read(appRouterProvider).replaceAll([const LoginPage()]);
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: getGlobalAppBar(text: S.of(context).profile),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: Text('${S.of(context).eMailAddress}:')),
                  Text(
                    '${data.currentUser?.email}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: Text('${S.of(context).lastSignInTime}:')),
                  Text(
                    DateFormat.yMd().add_Hm().format(DateTime.tryParse('${data.currentUser?.metadata.lastSignInTime}')??DateTime.now()),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 48.0),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: GlobalBtn(text: S.of(context).goOut, onTap: () {
                auth.signOut();
              },)

            ),
          ],
        ),
      ),
    );
  }
}
