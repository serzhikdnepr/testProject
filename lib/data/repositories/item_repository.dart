import 'package:test_project/data/data.dart';

abstract class ItemRepository {
  Future<void> addItem(Item item);

  Future<void> updateItem(Item item);

  Future<void> deleteItem(Item item);

  Future<List<Item>> getAllItems(String userEmail);
}
