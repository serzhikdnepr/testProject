import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../data/models/item.dart';
import '../generated/l10n.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.item,
    required this.editItem,
    required this.deleteItem,
  });

  final Item item;
  final Function() editItem;
  final Function() deleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Text(
            item.descriptions,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            "${item.date} ${item.time}",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                    child: GFButton(
                  onPressed: editItem,
                  type: GFButtonType.solid,
                  shape: GFButtonShape.pills,
                  color: GFColors.SECONDARY,
                  text: S.of(context).editElement,
                )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: GFButton(
                  onPressed: deleteItem,
                  type: GFButtonType.solid,
                  shape: GFButtonShape.pills,
                  color: GFColors.DANGER,
                  text: S.of(context).delete,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
