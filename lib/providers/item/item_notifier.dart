import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data.dart';
import '../providers.dart';

class ItemNotifier extends StateNotifier<ItemState> {
  final ItemRepository _repository;
  final String _userEmail;

  ItemNotifier(this._repository, this._userEmail)
      : super(const ItemState.initial()) {
    getItems(_userEmail);
  }

  Future<void> createItem(Item item) async {
    try {
      await _repository.addItem(item);
      getItems(_userEmail);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteItem(Item item) async {
    try {
      await _repository.deleteItem(item);
      getItems(_userEmail);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateItem(Item item) async {
    try {
      final updatedItem = item.copyWith();

      await _repository.updateItem(updatedItem);
      getItems(_userEmail);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getItems(String userEmail) async {
    try {
      final items = await _repository.getAllItems(userEmail);
      state = state.copyWith(items: items);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
