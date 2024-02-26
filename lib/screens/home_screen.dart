import 'package:auto_route/auto_route.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:test_project/router/router.gr.dart';
import 'package:test_project/widgets/widgets.dart';

import '../data/data.dart';
import '../generated/l10n.dart';
import '../providers/providers.dart';
import '../router/router.dart';
import '../utils/utils.dart';
import 'package:intl/intl.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemState = ref.watch(itemsProvider);

    void createTask() async {
      final faker = Faker.instance;
      final title = faker.name.title();
      final descriptions = faker.name.jobTitle();

      final date = ref.watch(dateProvider);
      final data = ref.watch(fireBaseAuthProvider);

      final item = Item(
        title: title,
        time: DateFormat.Hm().format(date),
        date: DateFormat.yMd().format(date),
        descriptions: descriptions,
        userEmail: "${data.currentUser?.email}",
      );

      await ref.read(itemsProvider.notifier).createItem(item).then((value) {
        AppAlerts.displaySnackbar(
            context, S.of(context).itemCreatedSuccessfully);
      });
    }

    return Scaffold(
      appBar: getGlobalAppBar(text: S.of(context).home, actions: [
        GFIconButton(
          icon: const Icon(
            Icons.add,
            color: GFColors.PRIMARY,
          ),
          onPressed: () {
            createTask();
          },
          color: GFColors.TRANSPARENT,
          padding: const EdgeInsets.only(right: 16),
        )
      ]),
      body: SafeArea(
        child: itemState.items.isEmpty
            ? Center(
          child: Text(
            S.of(context).noProducts,
          ),
        )
            : ListView.separated(
          shrinkWrap: true,
          itemCount: itemState.items.length,
          padding: EdgeInsets.all(16),

          itemBuilder: (ctx, index) {
            final item = itemState.items[index];

            return ItemTile(
              item: item,
              editItem: () {
                ref
                    .read(appRouterProvider)
                    .push(EditItemRoute(item: item));
              },
              deleteItem: () async {
                await AppAlerts.showAlertDeleteDialog(
                  context: context,
                  ref: ref,
                  item: item,
                );
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1.5,
          ),
        ),
      ),
    );
  }
}
