import 'package:test_project/data/data.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemsDatasource _datasource;
  ItemRepositoryImpl(this._datasource);

  @override
  Future<void> addItem(Item item) async {
    try {
      await _datasource.addItem(item);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteItem(Item item) async {
    try {
      await _datasource.deleteItem(item);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Item>> getAllItems(String userEmail) async {
    try {
      return await _datasource.getAllItems(userEmail);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateItem(Item item) async {
    try {
      await _datasource.updateItem(item);
    } catch (e) {
      throw '$e';
    }
  }
}
