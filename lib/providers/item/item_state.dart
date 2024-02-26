import '../../data/data.dart';

class ItemState {
  final List<Item> items;

  const ItemState({
    required this.items,
  });

  const ItemState.initial({
    this.items = const [],
  });

  ItemState copyWith({
    List<Item>? items,
  }) {
    return ItemState(
      items: items ?? this.items,
    );
  }
}
