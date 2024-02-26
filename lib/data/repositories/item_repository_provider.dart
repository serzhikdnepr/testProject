import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/data/data.dart';

final itemsRepositoryProvider = Provider<ItemRepository>((ref) {
  final datasource = ref.read(itemDatasourceProvider);
  return ItemRepositoryImpl(datasource);
});
